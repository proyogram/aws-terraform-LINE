# module "eventbridge" {
#   source                 = "./modules/api-gateway"
#   prefix                = "tf_"
#   tr_lambda-invoke-arn = module.lambda.tr_lambda-invoke-arn
# }

module "stop_running_ec2" {
  source = "./modules/stop_running_ec2"
  prefix = "tf-line-stop-running-ec2"
  secret_id_key = "LINE_ACCESS_TOKEN_STOP_EC2"
}
