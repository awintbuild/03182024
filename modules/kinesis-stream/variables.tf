variable "s3_bucket_name" {
  type = string
}


variable "kinesis_kms_master_key_id" {
  type    = string
  default = "alias/aws/sqs"
}

variable "kinesis_enforce_consumer_deletion" {
  type = bool
  default = false
  
}

variable "kinesis_max_message_size" {
  default = 2048
}

variable "kinesis_shard_count" {
  default = 1
}

variable "kinesis_retention_period" {
  description = "Length of time data records are accessible after they are added to the stream."
  type = number
  default = 24

  validation {
    condition = var.kinesis_retention_period >= 24 && var.kinesis_retention_period <= 168
    error_message = "Rentention period must be greater than 24 and less than 168 hours"
  }
}

variable "kinesis_encryption_type" {
  type    = string
  default = "KMS"
}

variable "kinesis_shard_level_metrics" {
  type = list(any)
  default = [
    "IncomingBytes",
    "OutgoingBytes",
  ]
}

variable "kinesis_stream_mode" {
  type = string
  default = "ON_DEMAND"
}

variable "kinesis_destination" {
  type    = string
  default = "extended_s3"
}

variable "kinesis_buffering_size" {
  default = 10
}

variable "kinesis_buffering_interval" {
  default = 400
}

variable "kinesis_compression_format" {
  type    = string
  default = "GZIP"
}

variable "comparison_operator" {
  type = string
  default = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  type = number
  default = 1
}

variable "metric_name" {
  type = string
  default = "IncomingRecords"
}

variable "namespace" {
  type = string
  default = "AWS/Firehose"
}

variable "period" {
  type = number
  default = 300
}

variable "statistic" {
  type = string
  default = "Average"
}

variable "threshold" {
  type = number
  default = 1000
}

variable "tags" {
  description = "Tags are used to track resources"
  type = map(string)
  default = {
    Module = "kinesis-stream"
    Department = "Data Team" 
  }

}

