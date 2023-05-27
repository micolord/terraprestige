// EC2 alerts GL
resource "aws_cloudwatch_metric_alarm" "gl_fe_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-gl-fe1-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
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
  period                    = 120
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

resource "aws_cloudwatch_metric_alarm" "gl_be_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-gl-be1-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.gl-node3.id
  }
}

resource "aws_cloudwatch_metric_alarm" "gl_be2_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-gl-be2-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.gl-node4.id
  }
}

// EC2 alerts BO
resource "aws_cloudwatch_metric_alarm" "bo_fe_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-bo-fe1-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.node1.id
  }
}

resource "aws_cloudwatch_metric_alarm" "bo_fe2_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-bo-fe2-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.node2.id
  }
}

resource "aws_cloudwatch_metric_alarm" "bo_be_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-bo-be1-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.node3.id
  }
}

resource "aws_cloudwatch_metric_alarm" "bo_be2_ec2_cpu" {
  alarm_name                = "${var.env_name}-${var.project}-bo-be2-ec2-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "Average EC2 CPU utilization over last 5 minutes too high"
  alarm_actions             = [aws_sns_topic.ec2_cpu.arn]
  ok_actions                = [aws_sns_topic.ec2_cpu_subsided.arn]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.node4.id
  }
}

// RDS alerts
resource "aws_cloudwatch_metric_alarm" "master_rds_cpu" {
  alarm_name          = "${var.env_name}-${var.project}-master-rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 120
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

resource "aws_cloudwatch_metric_alarm" "master_low_memory" {
  alarm_name          = "${var.env_name}-${var.project}-master-rds-low-memory"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Maximum"
  threshold           = "10000"
  alarm_description   = "Database instance memory above threshold"
  alarm_actions       = [aws_sns_topic.db_memory.arn]
  ok_actions          = [aws_sns_topic.db_memory_subsided.arn]
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
  period              = 120
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

resource "aws_cloudwatch_metric_alarm" "replica_low_memory" {
  alarm_name          = "${var.env_name}-${var.project}-replica-rds-low-memory"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Maximum"
  threshold           = "10000"
  alarm_description   = "Database instance memory above threshold"
  alarm_actions       = [aws_sns_topic.db_memory.arn]
  ok_actions          = [aws_sns_topic.db_memory_subsided.arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.master.id
  }
}

// DASHBOARD
resource "aws_cloudwatch_dashboard" "MetaBets" {
  dashboard_name = "${var.env_name}-${var.project}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "InstanceId", "${aws_instance.gl-node1.id}"],
            [ ".", ".", ".", "${aws_instance.gl-node2.id}"]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "GL FE CPU"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "InstanceId", "${aws_instance.gl-node3.id}"],
            [ ".", ".", ".", "${aws_instance.gl-node4.id}"]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "GL BE CPU"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "InstanceId", "${aws_instance.node1.id}"],
            [ ".", ".", ".", "${aws_instance.node2.id}"]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "BO FE CPU"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "InstanceId", "${aws_instance.node3.id}"],
            [ ".", ".", ".", "${aws_instance.node4.id}"]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "BO BE CPU"
        }
      }
    ]
  })
}