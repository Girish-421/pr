resource "aws_iam_role" "ec2_role" {
  name = "ec2-s3-access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3_Access_Policy"
  description = "IAM policy to allow EC2 access to S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = [
          "arn:aws:s3:::giribuck",
          "arn:aws:s3:::giribuck/*"
        ]
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_s3_instance_profile"
  role = aws_iam_role.ec2_role.name
}
