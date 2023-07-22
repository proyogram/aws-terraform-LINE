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
  description = "Secrets ManagerからLINEのアクセストークンを取ってくるためのシークレットキー"
}

variable "cron_notification_schedule" {
  type        = string
  description = "Secrets ManagerからLINEのアクセストークンを取ってくるためのシークレットキー"
}
