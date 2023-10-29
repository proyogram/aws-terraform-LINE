variable "LINE_USER_ID" {
  type        = string
  description = "LambdaからLINEを送るために必要なUSER_IDを環境変数から取得"
}

variable "LINE_ACCESS_TOKEN" {
  type        = string
  description = "LambdaからLINEを送るために必要なACCESS_TOKENを環境変数から取得"
}

variable "LINE_USER_ID_RUNNING_EC2" {
  type        = string
  description = "LambdaからLINEを送るために必要なUSER_IDを環境変数から取得"
}

variable "LINE_ACCESS_TOKEN_RUNNING_EC2" {
  type        = string
  description = "LambdaからLINEを送るために必要なACCESS_TOKENを環境変数から取得"
}
