resource "aws_api_gateway_rest_api" "main" {
  name = "${var.prefix}-api-post-to-lambda"
}

resource "aws_api_gateway_method" "main" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_rest_api.main.root_resource_id
  rest_api_id   = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_integration" "main" {
  http_method             = aws_api_gateway_method.main.http_method
  resource_id             = aws_api_gateway_rest_api.main.root_resource_id
  rest_api_id             = aws_api_gateway_rest_api.main.id
  integration_http_method = "POST"
  type                    = "AWS_PROXY" #lambda統合プロキシ設定。
  uri                     = aws_lambda_function.main.invoke_arn
}

resource "aws_api_gateway_deployment" "main" {
  depends_on = [
    aws_api_gateway_integration.main
  ]
  rest_api_id = aws_api_gateway_rest_api.main.id
  stage_name  = "test"
  triggers = {
    redeployment = filebase64("${path.module}/main_api_gateway.tf")
  }
}
