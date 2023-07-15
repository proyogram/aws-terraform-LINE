# module "eventbridge" {
#   source                 = "./modules/api-gateway"
#   prefix                = "tf_"
#   tr_lambda-invoke-arn = module.lambda.tr_lambda-invoke-arn
# }

module "running_ec2_with_line" {
  source = "./modules/running_ec2_with_line"
  prefix = "tf-01-notice-running-ec2-with-line"
  secret_id_key = "LINE_ACCESS_TOKEN_STOP_EC2"
}
