# ECS Container Instances

resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2_profile"
    role = "${aws_iam_role.EC2role.name}"
}

resource "aws_iam_role" "EC2role" {
    name = "EC2role"
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
/*
resource "aws_instance" "ecs-instance01" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    iam_instance_profile        = "ec2_profile"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance01"
    }
}

resource "aws_instance" "ecs-instance02" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance02"
    }
}

resource "aws_instance" "ecs-instance03" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance03"
    }
}

resource "aws_instance" "ecs-instance04" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance04"
    }
}

resource "aws_instance" "ecs-instance05" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance05"
    }
}

resource "aws_instance" "ecs-instance06" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance06"
    }
}

resource "aws_instance" "ecs-instance07" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance07"
    }

resource "aws_instance" "ecs-instance08" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    availability_zone           = "eu-west-1a"
    subnet_id                   = "${aws_subnet.wp-public-tf.id}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    iam_instance_profile        = "ec2_profile"
    //iam_instance_profile        = "${aws_iam_role.EC2role.id}"
    security_groups             = ["${aws_security_group.wp-ecs-sg-tf.id}"]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
    tags {
      Name = "ecs-instance08"
    }

}
*/
