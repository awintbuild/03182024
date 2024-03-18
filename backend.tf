terraform {
  backend "s3" {
    bucket               = "ctl-tf-kinesis-useast1" 
    key                  = "terraform/state/apps/kinesis/kinesis.tf" 
    workspace_key_prefix = "terraform"
    region               = "us-east-1"
  }
}