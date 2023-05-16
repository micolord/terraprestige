
// EC2 alerts
resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

}

// RDS alerts
resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "${var.env_name}-${var.project}-rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Average database CPU utilization over last 5 minutes too high"
  alarm_actions       = [aws_sns_topic.db_cpu.arn]
  ok_actions          = [aws_sns_topic.db_cpu_subsided.arn]
  treat_missing_data  = "notBreaching"

}