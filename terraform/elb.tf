resource "aws_elb" "default" {
    name               = "wp-elb-tf"
    subnets            = ["${aws_subnet.wp-public-tf.id}"]
    security_groups    = ["${aws_security_group.wp-sg-elb-tf.id}"]

    listener {
        instance_port     = 80
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol       = "http"
    }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 2
        timeout             = 3
        target              = "HTTP:80/"
        interval            = 5
    }

    tags {
        Name = "wp-elb-tf"
    }

    # instances = ["${aws_instance.ecs-instance01.id}","${aws_instance.ecs-instance02.id}"]
    cross_zone_load_balancing = true
}

resource "aws_autoscaling_attachment" "asg_elb" {
  autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
  elb                    = "${aws_elb.default.id}"
}

/*
resource "aws_elb_attachment" "instance-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.asg.id}"
}

resource "aws_elb_attachment" "instance02-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.ecs-instance02.id}"
}

resource "aws_elb_attachment" "instance03-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.ecs-instance03.id}"
}

resource "aws_elb_attachment" "instance04-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.ecs-instance04.id}"
}

resource "aws_elb_attachment" "instance05-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.ecs-instance05.id}"
}

resource "aws_elb_attachment" "instance06-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.ecs-instance06.id}"
}

resource "aws_elb_attachment" "instance07-attach" {
  elb      = "${aws_elb.default.id}"
  instance = "${aws_instance.ecs-instance07.id}"
}
*/

resource "aws_lb_cookie_stickiness_policy" "wp-elb-tf-policy" {
    name                     = "wp-elb-tf-policy"
    load_balancer            = "${aws_elb.default.id}"
    lb_port                  = 80
    cookie_expiration_period = 600
}
