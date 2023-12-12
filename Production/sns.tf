/*
resource "aws_sns_topic" "ec2_cpu" {
  name              = "${var.env_name}-${var.project}-EC2-HIGH-CPU"
}

resource "aws_lambda_permission" "ec2_cpu" {
  statement_id  = "AllowExecutionFromSNS_HIGHEC2CPU"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.ec2_cpu.arn
}

resource "aws_sns_topic_subscription" "ec2_cpu" {
  topic_arn = aws_sns_topic.ec2_cpu.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
}

resource "aws_sns_topic" "ec2_cpu_subsided" {
  name              = "${var.env_name}-${var.project}-EC2-HIGH-CPU-RESOLVED"
}

resource "aws_lambda_permission" "ec2_cpu_subsided" {
  statement_id  = "AllowExecutionFromSNS_HIGHEC2CPURESOLVED"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.ec2_cpu_subsided.arn
}

resource "aws_sns_topic_subscription" "ec2_cpu_subsided" {
  topic_arn = aws_sns_topic.ec2_cpu_subsided.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
}

resource "aws_sns_topic" "ec2_memory" {
  name              = "${var.env_name}-${var.project}-EC2-HIGH-MEMORY"
}

resource "aws_lambda_permission" "ec2_memory" {
  statement_id  = "AllowExecutionFromSNS_HIGHEC2MEMORY"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.ec2_memory.arn
}

resource "aws_sns_topic_subscription" "ec2_memory" {
  topic_arn = aws_sns_topic.ec2_memory.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
}

resource "aws_sns_topic" "db_cpu" {
  name              = "${var.env_name}-${var.project}-RDS-HIGH-CPU"
}

resource "aws_lambda_permission" "db_cpu" {
  statement_id  = "AllowExecutionFromSNS_HIGHRDSCPU"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.db_cpu.arn
}

resource "aws_sns_topic_subscription" "db_cpu" {
  topic_arn = aws_sns_topic.db_cpu.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
}

resource "aws_sns_topic" "db_cpu_subsided" {
  name = "${var.env_name}-${var.project}-RDS-HIGH-CPU-RESOLVED"
}

resource "aws_lambda_permission" "db_cpu_subsided" {
  statement_id  = "AllowExecutionFromSNS_HIGHRDSCPURESOLVED"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.db_cpu_subsided.arn
}

resource "aws_sns_topic_subscription" "db_cpu_subsided" {
  topic_arn = aws_sns_topic.db_cpu_subsided.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
}

resource "aws_sns_topic" "db_memory" {
  name = "${var.env_name}-${var.project}-RDS-HIGH-MEMORY"
}

resource "aws_lambda_permission" "db_memory" {
  statement_id  = "AllowExecutionFromSNS_HIGHRDSMEMORY"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.db_memory.arn
}

resource "aws_sns_topic_subscription" "db_memory" {
  topic_arn = aws_sns_topic.db_memory.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
}

resource "aws_sns_topic" "db_memory_subsided" {
  name = "${var.env_name}-${var.project}-RDS-HIGH-MEMORY-RESOLVED"
}

resource "aws_lambda_permission" "db_memory_subsided" {
  statement_id  = "AllowExecutionFromSNS_HIGHRDSMEMORYRESOLVED"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.webhook_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.db_memory_subsided.arn
}

resource "aws_sns_topic_subscription" "db_memory_subsided" {
  topic_arn = aws_sns_topic.db_memory_subsided.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.webhook_lambda.arn
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


data "aws_iam_policy_document" "allow-cw-policy" {
  policy_id = "${var.env_name}-${var.project}-AllowCW-policy"

    statement {
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey*"
    ]
    
    effect = "Allow"
    
    principals {
      type        = "Service"
      identifiers = ["cloudwatch.amazonaws.com"]
    }
    resources = ["*"]
  }
}
*/