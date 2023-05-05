resource "aws_iam_instance_profile" "backoffice-ssm-profile" {
  name = "${var.env_name}-${var.project}-bo-ssm-profile"
  role = aws_iam_role.backoffice-ssm-role.name
}

resource "aws_iam_role" "backoffice-ssm-role" {
  name = "${var.env_name}-${var.project}-bo-ssm-role"

  # Terraform's "jsonencode" function converts a 
  # Terraform expression result to valid JSON syntax test.
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
  instance_type          = "c5.large"
  ami                    = "ami-04f6e8d9cd4ba9e8c"
  vpc_security_group_ids = [aws_security_group.sg5.id]
  subnet_id              = aws_subnet.private_subnet1.id

iam_instance_profile = aws_iam_instance_profile.backoffice-ssm-profile.name

  tags = {
    Name = "test"
  }

  #user_data = file("${path.root}/ec2/userdata.tpl")
} 

resource "aws_lb_target_group_attachment" "node1" {
  target_group_arn = aws_lb_target_group.alb2-tg.arn
  target_id        = aws_instance.node1.id
  port             = 80
} 