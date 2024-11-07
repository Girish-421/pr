resource "aws_security_group" "terraform_sg" {
  name        = "allow_ssh_s3"
  description = "Security group to allow SSH and S3 access"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (adjust as needed)
  }

  egress {
    protocol    = "-1"  # Allow all outbound traffic
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2_Security_Group"
  }
}
