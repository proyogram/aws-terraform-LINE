# lambda用のiamロールを定義
resource "aws_iam_role" "lambda" {
  name               = "${var.prefix}_role_for_lambda"
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




resource "aws_iam_role" "eventbridge_scheduler" {
  name               = "${var.prefix}_role_for_eventbridge"
  assume_role_policy = data.aws_iam_policy_document.eventbridge_scheduler_assume.json
}

resource "aws_iam_role_policy" "eventbridge_scheduler_custom" {
  name   = "${var.prefix}_role_for_eventbridge"
  role   = aws_iam_role.eventbridge_scheduler.name
  policy = data.aws_iam_policy_document.eventbridge_scheduler_custom.json
}