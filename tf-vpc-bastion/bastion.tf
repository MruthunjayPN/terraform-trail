resource "aws_instance" "bastion" {
  ami                         = "ami-06f621d90fa29f6d0" # Ubuntu 24.04 LTS (Mumbai)
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name                    = "tf-mpn-key-new" 
  tags = {
    Name = "mpn-bastion"
  }
}
