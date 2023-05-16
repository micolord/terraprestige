resource "aws_sns_topic" "ec2_cpu" {
  name              = "${var.env_name}-${var.project}-EC2-HIGH-CPU"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic" "ec2_memory" {
  name              = "${var.env_name}-${var.project}-EC2-HIGH-MEMORY"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic" "db_cpu" {
  name              = "${var.env_name}-${var.project}-RDS-HIGH-CPU"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic" "db_memory" {
  name              = "${var.env_name}-${var.project}-RDS-HIGH-MEMORY"
  kms_master_key_id = "alias/aws/sns"
}

/*
resource "aws_sns_topic" "alb_gl" {
  name              = "${var.env_name}-${var.project}-GL-LB-ALERT"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic" "alb_bo" {
  name              = "${var.env_name}-${var.project}-BO-LB-ALERT"
  kms_master_key_id = "alias/aws/sns"
}
*/