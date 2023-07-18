provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = ">= 1.4.0"
  backend "s3" {
    bucket         = "tf-state-backend-wakatay"
    region         = "ap-northeast-1"
    key            = "LINE/terraform.tfstate"
    encrypt        = true
  }
}
