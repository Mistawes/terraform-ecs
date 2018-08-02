output "elb_dns" {
    value = "${aws_elb.default.dns_name}"
}

/*
output "ecs_instance01" {
    value = "${aws_instance.ecs-instance01.public_ip}"
}

output "ecs_instance02" {
    value = "${aws_instance.ecs-instance02.public_ip}"
}

output "ecs_instance03" {
    value = "${aws_instance.ecs-instance03.public_ip}"
}

output "ecs_instance04" {
    value = "${aws_instance.ecs-instance04.public_ip}"
}

output "ecs_instance05" {
    value = "${aws_instance.ecs-instance05.public_ip}"
}

output "ecs_instance06" {
    value = "${aws_instance.ecs-instance06.public_ip}"
}

output "ecs_instance07" {
    value = "${aws_instance.ecs-instance07.public_ip}"
}
*/
