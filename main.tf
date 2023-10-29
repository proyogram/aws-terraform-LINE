module "stop_running_ec2" {
  source                     = "./modules/stop_running_ec2"
  prefix                     = "tf-line-stop-running-ec2"
  secret_id_key_access_token = "LINE_ACCESS_TOKEN_STOP_EC2"
}

module "weekly_notification" {
  source                     = "./modules/weekly_notification"
  prefix                     = "tf-line-weekly-notification"
  secret_id_key_user_id      = "LINE_USER_ID"
  secret_id_key_access_token = "LINE_ACCESS_TOKEN_STOP_EC2"
  cron_notification_schedule = "cron(0 22 ? * 1,5 *)"
}

module "budgets_alert" {
  source                     = "./modules/budgets_alert"
  prefix                     = "tf-budgets-alert"
  line_user_id               = "LINE_USER_ID"
  line_access_token          = "LINE_ACCESS_TOKEN"
  cron_notification_schedule = "cron(0 22 15 * ? *)"
  limit_cost_usd             = "5"
}

