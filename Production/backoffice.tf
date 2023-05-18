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
      ]
    })
  } 

  tags = {
    Name = "${var.env_name}-${var.project}-bo-ssm-role"
  }
}


resource "aws_instance" "node1" {
  instance_type          = var.bo_fe_instance_type
  ami                    = var.bo_fe_ami_id
  vpc_security_group_ids = [aws_security_group.sg5.id]
  subnet_id              = aws_subnet.private_subnet1.id

iam_instance_profile = aws_iam_instance_profile.backoffice-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-bo-fe-1"
  }

} 

resource "aws_lb_target_group_attachment" "node1" {
  target_group_arn = aws_lb_target_group.alb2-tg.arn
  target_id        = aws_instance.node1.id
  port             = 80
} 

resource "aws_instance" "node2" {
  instance_type          = var.bo_fe_instance_type
  ami                    = "ami-0bfbf738d0720e594"
  vpc_security_group_ids = [aws_security_group.sg5.id]
  subnet_id              = aws_subnet.private_subnet2.id

iam_instance_profile = aws_iam_instance_profile.backoffice-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-bo-fe-2"
  }
} 

resource "aws_lb_target_group_attachment" "node2" {
  target_group_arn = aws_lb_target_group.alb2-tg.arn
  target_id        = aws_instance.node2.id
  port             = 80
} 

resource "aws_instance" "node3" {
  instance_type          = var.bo_be_instance_type
  ami                    = var.bo_be_ami_id
  vpc_security_group_ids = [aws_security_group.sg6.id]
  subnet_id              = aws_subnet.private_subnet1.id

iam_instance_profile = aws_iam_instance_profile.backoffice-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-bo-be-1"
  }
} 

resource "aws_lb_target_group_attachment" "node3" {
  target_group_arn = aws_lb_target_group.alb2-tg2.arn
  target_id        = aws_instance.node3.id
  port             = 80
} 

resource "aws_instance" "node4" {
  instance_type          = var.bo_be_instance_type
  ami                    = "ami-03fe8ec68c3fb93e2"
  vpc_security_group_ids = [aws_security_group.sg6.id]
  subnet_id              = aws_subnet.private_subnet2.id

iam_instance_profile = aws_iam_instance_profile.backoffice-ssm-profile.name

  tags = {
    Name = "${var.env_name}-${var.project}-bo-be-2"
  }
} 

resource "aws_lb_target_group_attachment" "node4" {
  target_group_arn = aws_lb_target_group.alb2-tg2.arn
  target_id        = aws_instance.node4.id
  port             = 80
} 