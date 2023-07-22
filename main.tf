module "weekly_notification" {
  source                     = "./modules/weekly_notification"
  prefix                     = "tf-line-weekly-notification"
  secret_id_key_user_id      = "LINE_USER_ID"
  secret_id_key_access_token = "LINE_ACCESS_TOKEN_STOP_EC2"
  cron_notification_schedule = "cron(0 22 ? * 1,5 *)"
}

module "stop_running_ec2" {
  source                     = "./modules/stop_running_ec2"
  prefix                     = "tf-line-stop-running-ec2"
  secret_id_key_access_token = "LINE_ACCESS_TOKEN_STOP_EC2"
}
