variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "ami_id" {
    type = string
    description = "AMI id for EC2"
}

variable "instance_type" {
  type = string
  description = "type of the instance"
  default = "t2.micro"
}

variable "key_name" {
    type= string
    description = "Name of key pair in aws console"
}