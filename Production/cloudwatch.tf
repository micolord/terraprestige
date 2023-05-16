resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "${var.env_name}-${var.project}-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors ec2 cpu utilization"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  treat_missing_data        = "notBreaching"
}