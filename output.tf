output "PublicIP" {
  value       = aws_instance.terraform-instance.public_ip
  description = "The public IP address of the EC2 instance."
}
output "BucketName" {
  value       = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket."
}
