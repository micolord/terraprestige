resource "aws_iam_instance_profile" "jobprocessor-ssm-profile" {
  name = "${var.env_name}-${var.project}-jp-ssm-profile"
  role = aws_iam_role.jobprocessor-ssm-role.name
}

resource "aws_iam_role" "jobprocessor-ssm-role" {
  name = "${var.env_name}-${var.project}-jp-ssm-role"

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
  
  inline_policy {
    name = "${var.env_name}-${var.project}-iam-pass-policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
      {
            "Sid": "IamPassRole",
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:PassedToService": "ec2.amazonaws.com"
                }
            }
        },
        {
            "Sid": "SESAccess",
            "Effect": "Allow",
            "Action": [
                "ses:VerifyEmailIdentity",
                "ses:GetSendQuota",
                "ses:SendRawEmail",
                "ses:DeleteIdentity",
                "ses:GetIdentityVerificationAttributes",
                "ses:ListIdentities",
                "ses:VerifyDomainIdentity"
            ],
            "Resource": "*"
        },
        {
            "Sid": "S3Access",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl"
              ],
              "Resource": ["${aws_s3_bucket.bucket.arn}/*","${aws_s3_bucket.bucket.arn}"]
        },
      ]
    })
  } 

  tags = {
    Name = "${var.env_name}-${var.project}-jp-ssm-role"
  }
}

resource "aws_instance" "jp-node1" {
  instance_type          = var.jp_instance_type
  ami                    = var.jp_ami_id
  vpc_security_group_ids = [aws_security_group.sg8.id]
  subnet_id              = aws_subnet.private_subnet1.id

iam_instance_profile = aws_iam_instance_profile.jobprocessor-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-jp-1"
    Backup = true
  }

  lifecycle {
    ignore_changes = [ebs_optimized]
  }

} 

resource "aws_lb_target_group_attachment" "jp-node1" {
  target_group_arn = aws_lb_target_group.alb3-tg.arn
  target_id        = aws_instance.jp-node1.id
  port             = 80
} 