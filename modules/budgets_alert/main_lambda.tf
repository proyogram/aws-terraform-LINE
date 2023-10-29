resource "aws_lambda_function" "main" {
  function_name    = "${var.prefix}-lambda-push-msg-to-line"
  filename         = data.archive_file.archieve_lambda.output_path
  role             = aws_iam_role.lambda.arn
  handler          = "push_msg_line.lambda_handler"
  source_code_hash = data.archive_file.archieve_lambda.output_base64sha256
  runtime          = "python3.10"
  timeout          = 30
  environment {
    variables = {
      LINE_USER_ID      = var.line_user_id,
      LINE_ACCESS_TOKEN = var.line_access_token
    }
  }
}

resource "aws_lambda_permission" "main" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.main.arn
}
