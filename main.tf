/*locals {
  tags = {
    "Environment"        = lower(var.environment)
    "TerraformManaged"   = "True"
  }
  abbreviations = {
    env = {
      sandbox = "sbx"
      development = "dev"
      qa = "qa"
      stage = "stg"
      production = "prod"
      management = "mgmt"
    }
    location = {
      eastus = "us-east-1"
      eastus2 = "us-east-2"
      westus = "us-west-1"
      westus2 = "us-west-2"
    }
  }
}*/

module "kinesis-stream" {
  source               = "./modules/kinesis-stream"
  s3_bucket_name       = var.s3_bucket_name
}