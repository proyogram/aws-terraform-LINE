module "budgets_alert" {
  source            = "./modules/budgets_alert"
  prefix            = "tf-budgets-alert"
  line_user_id      = var.LINE_USER_ID
  line_access_token = var.LINE_ACCESS_TOKEN
  limit_cost_usd    = "5"
}

module "stop_running_ec2" {
  source            = "./modules/stop_running_ec2"
  prefix            = "tf-line-stop-running-ec2"
  line_access_token = var.LINE_ACCESS_TOKEN_RUNNING_EC2
}

module "weekly_notification" {
  source                     = "./modules/weekly_notification"
  prefix                     = "tf-line-weekly-notification"
  line_user_id               = var.LINE_USER_ID_RUNNING_EC2
  line_access_token          = var.LINE_ACCESS_TOKEN_RUNNING_EC2
  cron_notification_schedule = "cron(0 22 ? * 1,5 *)"
}
