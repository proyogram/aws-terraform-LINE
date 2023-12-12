data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "default"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        data.aws_caller_identity.current.account_id
      ]
    }
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = [
      aws_sns_topic.main.arn,
    ]
    sid = "default_policy"
  }
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.main.arn]
    sid       = "budgets_policy"
  }
}

resource "aws_sns_topic" "main" {
  name = "${var.prefix}-sns-topic"
}

resource "aws_sns_topic_policy" "main" {
  arn = aws_sns_topic.main.arn

  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

resource "aws_sns_topic_subscription" "main" {
  topic_arn = aws_sns_topic.main.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.main.arn
}
