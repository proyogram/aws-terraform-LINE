variable "prefix" {
  type        = string
  description = "全てのリソースの文字前に付与される値"
}

variable "secret_id_key"{
  type        = string
  description = "Secrets ManagerからLINEのアクセストークンを取ってくるためのシークレットキー"
}