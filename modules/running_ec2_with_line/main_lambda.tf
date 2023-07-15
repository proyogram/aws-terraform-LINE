resource "aws_lambda_function" "main" {
  function_name    = "${var.prefix}-lambda-reply-line"
  filename         = data.archive_file.archieve_lambda.output_path
  role             = aws_iam_role.lambda.arn
  handler          = "lambda.lambda_handler"
  source_code_hash = data.archive_file.archieve_lambda.output_base64sha256
  runtime          = "python3.10"
  timeout          = 30
  environment {
    variables = {
      SECRET_ID_KEY = var.secret_id_key
    }
  }
}

resource "aws_lambda_permission" "main" {
  statement_id  = "allow_apigw_trigger_permission"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_deployment.main.execution_arn}/POST/"
}
