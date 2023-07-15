# lambda用のiamロールを定義
resource "aws_iam_role" "lambda" {
  name               = "${var.prefix}_main"
  assume_role_policy = data.aws_iam_policy_document.assume_lambda.json
  inline_policy {
    name   = "${var.prefix}_inline_policy_for_lambda"
    policy = data.aws_iam_policy_document.inline_lambda.json
  }
}

# lambda用のiamロールにマネージドポリシーをアタッチ
resource "aws_iam_role_policy_attachment" "lambda_execution_role" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}