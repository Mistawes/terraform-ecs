variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "vpc_cidr_block" {
  description = "VPC network"
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet"
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet"
  default     = "10.1.2.0/24"
}

variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "availability_zones" {
  description = "Availability Zones"
  default     = "eu-west-1a,eu-west-1b,eu-west-1c"
}

variable "ecs_cluster_name" {
  description = "ECS cluster Name"
  default     = "ecs-tf"
}

variable "amis" {
  description = "ECS Container Instances AMIs"
  default = {
    ap-northeast-1 = "ami-7e4a5b10"
    ap-southeast-1 = "ami-be63a9dd"
    ap-southeast-2 = "ami-b8cbe8db"
    eu-central-1   = "ami-9aeb0af5"
    # eu-west-1      = "ami-9c9819ef"
    eu-west-1      = "ami-8fcc32f6" # ecs-optimised
    us-east-1      = "ami-67a3a90d"
    us-west-1      = "ami-b7d5a8d7"
    us-west-2      = "ami-c7a451a7"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "db_instance_type" {
  description = "RDS instance type"
  default = "db.t2.micro"
}

variable "key_name" {
  description = "SSH key name to access the EC2 instances"
  default     = "WesleyMoore"
}

variable "db_name" {
  description = "RDS DB name"
  default = "wordpressdb"
}

variable "db_user" {
  description = "RDS DB username"
  default = "ecs"
}

variable "db_password" {
  description = "RDS DB password"
  default = "Qwerty12345-"
}

variable "wp_title" {
  description = "Wordpress title"
  default = "My Wordpress on ECS"
}

variable "wp_user" {
  description = "Wordpress username"
  default = "admin"
}

variable "wp_password" {
  description = "Wordpress password"
  default = "Qwerty12345-"
}

variable "wp_mail" {
  description = "Wordpress email"
  default = "wes.moore@gmail.com"
}

variable "registry_url" {
  description = "Docker private registry URL, defaults to Docker index"
  default = "https://index.docker.io/v1/"
}

variable "registry_email" {
  description = "Docker private registry login email address"
  default = "wes.moore@gmail.com"
}

variable "registry_auth" {
  description = "Docker private registry login auth token (from ~/.dockercgf)"
  default = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsIng1YyI6WyJNSUlDTHpDQ0FkU2dBd0lCQWdJQkFEQUtCZ2dxaGtqT1BRUURBakJHTVVRd1FnWURWUVFERXp0Uk5Gb3pPa2RYTjBrNldGUlFSRHBJVFRSUk9rOVVWRmc2TmtGRlF6cFNUVE5ET2tGU01rTTZUMFkzTnpwQ1ZrVkJPa2xHUlVrNlExazFTekFlRncweE56QTFNREl5TWpBME5UZGFGdzB4T0RBMU1ESXlNakEwTlRkYU1FWXhSREJDQmdOVkJBTVRPMDFPTms0NlJraFVWenBKV0VWSE9rOUpOMUU2UVRWWFJqcFpSRVUwT2pkRE4wNDZSMWRKVVRvMVZ6STNPa2hPTlVvNlZVNURRVG95U0UxQ01Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMERBUWNEUWdBRU5KRklhQ1hHNWYxSk9BZnZSaTJDU081K1Q5RVpKd2doai9SUXgzNW9Uc3Q4RnhXY0dRc3ZOMG5sdW5DVVdIbENxN2I4NFJRTXV0WUVIUnY4MVhweTU2T0JzakNCcnpBT0JnTlZIUThCQWY4RUJBTUNCNEF3RHdZRFZSMGxCQWd3QmdZRVZSMGxBREJFQmdOVkhRNEVQUVE3VFU0MlRqcEdTRlJYT2tsWVJVYzZUMGszVVRwQk5WZEdPbGxFUlRRNk4wTTNUanBIVjBsUk9qVlhNamM2U0U0MVNqcFZUa05CT2pKSVRVSXdSZ1lEVlIwakJEOHdQWUE3VVRSYU16cEhWemRKT2xoVVVFUTZTRTAwVVRwUFZGUllPalpCUlVNNlVrMHpRenBCVWpKRE9rOUdOemM2UWxaRlFUcEpSa1ZKT2tOWk5Vc3dDZ1lJS29aSXpqMEVBd0lEU1FBd1JnSWhBSTJVUlpMQVRTM3R4bjNpNTY0SXVQSFEwQU1Mb1g5cTZCMmdnN01KSHJuTkFpRUE0Q3lzbmtENHhjQm42amdobVdnQzczQjdGVkszenFnOTV4ZjNRK2xGVHlrPSJdfQ.eyJhY2Nlc3MiOltdLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuaW8iLCJleHAiOjE1MDU3MzI0MjksImlhdCI6MTUwNTczMjEyOSwiaXNzIjoiYXV0aC5kb2NrZXIuaW8iLCJqdGkiOiJhSVJmblozNFYyejJibFNhT2pNRSIsIm5iZiI6MTUwNTczMTgyOSwic3ViIjoiIn0.We2JuXn2nikrVJltDbcrbFj99oWyvBQt1ZDtVJ6Qi8STA1zKgykgiBalF1QDPI9HXVTouBhVy70do7MUnkyafQ"
}
