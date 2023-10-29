variable "prefix" {
  type        = string
  description = "全てのリソースの文字前に付与される値"
}

variable "line_user_id" {
  type        = string
  description = "Secrets ManagerからLINEのアクセストークンを取ってくるためのシークレットキー"
}

variable "line_access_token" {
  type        = string
  description = "Secrets ManagerからLINEのユーザIDを取ってくるためのシークレットキー"
}

variable "limit_cost_usd" {
  type        = string
  description = "通知を行いたいコストの最大値。この値の50%, 70%, 80%, 100%を超えると通知がされる。"
}
