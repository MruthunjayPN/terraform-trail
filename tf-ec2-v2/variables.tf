variable "aws_region" {
    type = string
    description = "Region of our aws resources"
}

variable "key_name" {
    type = string
    description = "name of the key generated in the terminal which will be used to ssh into ec2"
}

variable "public_key_path" {
    type = string
    description = "path to local public key"
}

variable "instance_type" {
    type = string
    description = "type of instance to be created"
    default = "t2.micro"
}