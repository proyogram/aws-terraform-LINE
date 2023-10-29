variable "prefix" {
  type        = string
  description = "全てのリソースの文字前に付与される値"
}

variable "line_access_token" {
  type        = string
  description = "LINEのアクセストークン"
}

variable "line_user_id" {
  type        = string
  description = "LINEのユーザID"
}

variable "cron_notification_schedule" {
  type        = string
  description = "EventBridgeを実行させるスケジュールをcronで定義"
}
