
// EC2 alerts
resource "aws_cloudwatch_metric_alarm" "gl_fe_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-gl-fe1-ec2-high-cpu"
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

  dimensions = {
    InstanceId = aws_instance.gl-node1.id
  }
}

resource "aws_cloudwatch_metric_alarm" "gl_fe2_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-gl-fe2-ec2-high-cpu"
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

  dimensions = {
    InstanceId = aws_instance.gl-node2.id
  }
}

// RDS alerts
resource "aws_cloudwatch_metric_alarm" "master_rds_cpu" {
  alarm_name          = "${var.env_name}-${var.project}-master-rds-high-cpu"
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

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.master.id
  }


}

resource "aws_cloudwatch_metric_alarm" "replica_rds_cpu" {
  alarm_name          = "${var.env_name}-${var.project}-replica-rds-high-cpu"
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

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.replica.id
  }

}