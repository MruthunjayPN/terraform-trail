terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "example" {
   ami = var.ami_id
   instance_type = var.instance_type
   key_name = var.key_name  #reference to the existing key pair in aws ; if not we have to create a new one

   tags = {
        Name = "terraform ec2"
   }
}

