resource "aws_lambda_function" "main" {
  function_name    = "${var.prefix}-lambda-push-msg-to-line"
  filename         = data.archive_file.archieve_lambda.output_path
  role             = aws_iam_role.lambda.arn
  handler          = "lambda.lambda_handler"
  source_code_hash = data.archive_file.archieve_lambda.output_base64sha256
  runtime          = "python3.10"
  timeout          = 30
  environment {
    variables = {
      USER_ID_KEY      = var.secret_id_key_user_id,
      ACCESS_TOKEN_KEY = var.secret_id_key_access_token
    }
  }
}

resource "aws_lambda_permission" "main" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_scheduler_schedule.main.arn
}
