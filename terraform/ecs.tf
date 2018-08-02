resource "aws_ecs_cluster" "default" {
  name = "${var.ecs_cluster_name}"
}

resource "aws_iam_instance_profile" "ECSprofile" {
  name = "ECSprofile"
  role = "${aws_iam_role.ECSrole.name}"
}


resource "aws_iam_role_policy" "ECSrole" {
  name = "ECSrole"
  role = "${aws_iam_role.ECSrole.name}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "ecs:*",
        "ecr:*",
        "iam:*",
        "elasticloadbalancing:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "ECSrole" {
    name = "ECSrole"
    path = "/"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {"AWS": "*"},
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_launch_configuration" "asg" {
  name = "launch-config"
  image_id = "ami-8fcc32f6"
  key_name = "WesleyMoore"
  instance_type = "t2.micro"
  iam_instance_profile = "ECSprofile"
  user_data = "${data.template_file.wp-container.rendered}"
  security_groups = ["${aws_security_group.wp-ecs-sg-tf.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name = "asg"
  # availability_zones = ["eu-west-1a"] #["${var.availability_zones}"]
  vpc_zone_identifier = ["${aws_subnet.wp-public-tf.id}"]
  max_size = "4"
  min_size = "2"
  desired_capacity = "3"
  health_check_grace_period = 300
  health_check_type = "ELB"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.asg.name}"
}

resource "aws_ecs_task_definition" "wordpress" {
  family = "${var.ecs_cluster_name}"

  volume {
    name      = "wordpress-storage"
    host_path = "/ecs/wordpress-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [eu-west-1a, eu-west-1b, eu-west-1c]"
  }
  container_definitions = <<DEFINITION
[
    {
        "name": "wordpress",
        "image": "769668941606.dkr.ecr.eu-west-1.amazonaws.com/mistawes/wp-packer:4.5",
        "cpu": 10,
        "memory": 300,
        "essential": true,
        "portMappings": [
             {
                 "hostPort": 80,
                 "containerPort": 80,
                 "protocol": "tcp"
             }
         ],
        "links": [],
        "command": [
            "supervisord"
         ],
        "entryPoint": [
            "/entrypoint.sh"
         ],
        "environment": [
          {
            "name": "WORDPRESS_DB_HOST",
            "value": "$${db_host}"
          },
          {
            "name": "WORDPRESS_DB_USER",
            "value": "$${db_user}"
          },
          {
            "name": "WORDPRESS_DB_PASSWORD",
            "value": "$${db_password}"
          },
          {
            "name": "WORDPRESS_DB_NAME",
            "value": "$${db_name}"
          },
          {
            "name": "WORDPRESS_TITLE",
            "value": "$${wp_title}"
          },
          {
            "name": "WORDPRESS_USER",
            "value": "$${wp_user}"
          },
          {
            "name": "WORDPRESS_PASSWORD",
            "value": "$${wp_password}"
          },
          {
            "name": "WORDPRESS_MAIL",
            "value": "$${wp_mail}"
          }
        ],
        "mountPoints": null,
        "volumesFrom": null,
        "extraHosts": null,
        "logConfiguration": null,
        "ulimits": null,
        "dockerLabels": null
    }
]
DEFINITION
}

resource "aws_ecs_service" "wordpress-ecs-service" {
    name = "wordpress-ecs-service"
    cluster = "${aws_ecs_cluster.default.id}"
    task_definition = "${aws_ecs_task_definition.wordpress.arn}"
    desired_count = 2

    iam_role = "${aws_iam_role.ECSrole.id}"

    load_balancer {
        elb_name = "${aws_elb.default.id}"
        container_name = "wordpress"
        container_port = 80
    }
}
