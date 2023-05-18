data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "${var.env_name}-${var.project}-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess","arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

data "archive_file" "source_code" {
  type        = "zip"
  source_file = "files/lambda_function.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "webhook_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function.zip"
  function_name = "${var.env_name}-${var.project}-slack-webhook"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.source_code.output_base64sha256

  runtime = "python3.8"

  /*
  environment {
    variables = {
      foo = "bar"
    }
  }
  */
}