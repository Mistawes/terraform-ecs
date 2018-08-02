provider "aws" {
    shared_credentials_file = "/home/wes/.aws/credentials"
    //profile = "default"
    //access_key = "${var.aws_access_key}"
    //secret_key = "${var.aws_secret_key}"
    region     = "eu-west-1"
}
