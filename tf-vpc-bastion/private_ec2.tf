resource "aws_instance" "private_ec2" {
  ami                         = "ami-06f621d90fa29f6d0"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  vpc_security_group_ids      = [aws_security_group.private_ec2_sg.id]
  associate_public_ip_address = false
  key_name                    = "tf-mpn-key-new"
  user_data                   = file("${path.module}/user_data.sh")

  tags = {
    Name = "mpn-private"
  }
}
