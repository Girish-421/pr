resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id            = aws_vpc.my_vpc.id
  service_name      = "com.amazonaws.ap-south-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [aws_route_table.public_RT.id]
  tags = {
    Name = "S3_VPC_Endpoint"
  }
}