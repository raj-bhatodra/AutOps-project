# Create EC2
resource "aws_instance" "web" {
  count                       = 1
  ami                         = "ami-02eb7a4783e7e9317"
  instance_type               = "t2.micro"
  key_name                    = "test-ssh-key"
  subnet_id                   = aws_subnet.my-sub.id
  vpc_security_group_ids      = [aws_security_group.my-seq.id]
  associate_public_ip_address = true
  tags = {
    Name = "AutOps-project${count.index + 1}"
  }
}
