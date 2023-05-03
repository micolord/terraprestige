resource "aws_iam_instance_profile" "backoffice-ssm-profile" {
  name = "${var.env_name}-${var.project}-bo-ssm-profile"
  role = aws_iam_role.backoffice-ssm-role.name
}

resource "aws_iam_role" "backoffice-ssm-role" {
  name = "${var.env_name}-${var.project}-bo-ssm-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]

  tags = {
    Name = "${var.env_name}-${var.project}-bo-ssm-role"
  }
}