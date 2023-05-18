resource "aws_iam_instance_profile" "gamelobby-ssm-profile" {
  name = "${var.env_name}-${var.project}-gl-ssm-profile"
  role = aws_iam_role.gamelobby-ssm-role.name
}

resource "aws_iam_role" "gamelobby-ssm-role" {
  name = "${var.env_name}-${var.project}-gl-ssm-role"

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
      ]
    })
  } 

  tags = {
    Name = "${var.env_name}-${var.project}-gl-ssm-role"
  }
}


resource "aws_instance" "gl-node1" {
  instance_type          = var.gl_fe_instance_type
  ami                    = var.gl_fe_ami_id
  vpc_security_group_ids = [aws_security_group.sg3.id]
  subnet_id              = aws_subnet.private_subnet1.id

iam_instance_profile = aws_iam_instance_profile.gamelobby-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-gl-fe-1"
  }

} 

resource "aws_lb_target_group_attachment" "gl-node1" {
  target_group_arn = aws_lb_target_group.alb1-tg.arn
  target_id        = aws_instance.gl-node1.id
  port             = 80
} 

resource "aws_instance" "gl-node2" {
  instance_type          = var.gl_fe_instance_type
  ami                    = "ami-05539b840b390e981"
  vpc_security_group_ids = [aws_security_group.sg3.id]
  subnet_id              = aws_subnet.private_subnet2.id

iam_instance_profile = aws_iam_instance_profile.gamelobby-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-gl-fe-2"
  }
} 

resource "aws_lb_target_group_attachment" "gl-node2" {
  target_group_arn = aws_lb_target_group.alb1-tg.arn
  target_id        = aws_instance.gl-node2.id
  port             = 80
} 


resource "aws_instance" "gl-node3" {
  instance_type          = var.gl_be_instance_type
  ami                    = var.gl_be_ami_id
  vpc_security_group_ids = [aws_security_group.sg4.id]
  subnet_id              = aws_subnet.private_subnet1.id

iam_instance_profile = aws_iam_instance_profile.gamelobby-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-gl-be-1"
  }
} 

resource "aws_lb_target_group_attachment" "gl-node3" {
  target_group_arn = aws_lb_target_group.alb1-tg2.arn
  target_id        = aws_instance.gl-node3.id
  port             = 80
} 

resource "aws_instance" "gl-node4" {
  instance_type          = var.gl_be_instance_type
  ami                    = "ami-05449aac044ca499c"
  vpc_security_group_ids = [aws_security_group.sg4.id]
  subnet_id              = aws_subnet.private_subnet2.id

iam_instance_profile = aws_iam_instance_profile.gamelobby-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-gl-be-2"
  }
} 

resource "aws_lb_target_group_attachment" "gl-node4" {
  target_group_arn = aws_lb_target_group.alb1-tg2.arn
  target_id        = aws_instance.gl-node4.id
  port             = 80
} 
