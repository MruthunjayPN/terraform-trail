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

data "aws_vpc" "default" {
    default = true
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical (official Ubuntu images)
}

resource "aws_key_pair" "generated" {
    key_name = var.key_name
    public_key = file(var.public_key_path)
}
resource "aws_security_group" "ssh_sg" {
    name = "allow-ssh"
    description = "allow ssh from anywhere"
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow_ssh"
    }
}

resource "aws_instance" "example" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = aws_key_pair.generated.key_name
    vpc_security_group_ids = [aws_security_group.ssh_sg.id]

    tags = {
      Name = "EC2-keygen"
    }
}