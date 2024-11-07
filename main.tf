resource "aws_instance" "terraform-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = var.PUB_KEY
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  iam_instance_profile    = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    Name = "Terraform_Instance"
  }
}
