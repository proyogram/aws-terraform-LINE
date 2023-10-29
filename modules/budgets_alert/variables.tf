variable "prefix" {
  type        = string
  description = "全てのリソースの文字前に付与される値"
}

variable "secret_id_key_access_token" {
  type        = string
  description = "Secrets ManagerからLINEのアクセストークンを取ってくるためのシークレットキー"
}

variable "secret_id_key_user_id" {
  type        = string
  description = "Secrets ManagerからLINEのユーザIDを取ってくるためのシークレットキー"
}

variable "cron_notification_schedule" {
  type        = string
  description = "EventBridgeを実行させるスケジュールをcronで定義"
}

variable "limit_cost_usd" {
  type        = string
  description = "通知を行いたいコストの最大値。この値の50%, 70%, 80%, 100%を超えると通知がされる。"
}
