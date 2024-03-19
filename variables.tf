##############################
# Main Variables
##############################

variable "region" {
  description = "Location where resources will be deployed to"
  type        = string
  default     = "us-east-1"
}


variable "s3_bucket_name" {
  type     = string
  default  = ""
}
