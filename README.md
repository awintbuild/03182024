# Real-Time Analytics with Spark Streaming Module

## Purpose

The purpose of this Terraform module is to provide developers with a simplified way to deploy infrastructure that's required for real-time analytics.

## Description

Terraform Module that deploys a Kinesis Data Stream, a Kinesis Data Firehose, along with an extended s3 bucket, iam role and policy,cloud watch dashboard, and cloud watch alarm for metrics.

## Usage Instructions

You will find the below module. Copy and paste the module into your Terraform configuration, and insert or update the variables, then run `terraform init`:

```
module "kinesis-stream" {
  source               = "./modules/kinesis-stream"
  s3_bucket_name       = var.s3_bucket_name
}
```

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| name | Identify's the stream using this module. | string | - | yes |
| shard_count | The number of shards that the stream will use. More information can be found [here](https://docs.aws.amazon.com/kinesis/latest/dev/amazon-kinesis-streams.html) | number | - | no |
| retention_period | Length of time data records are accessible after they are added to the stream. | number | 24 | no |
| shard_level_metrics | A list of shard-level CloudWatch metrics which can be enabled for the stream.| list | - | no |
| enforce_consumer_deletion | A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error. | bool | false | no |
| encryption type | The encryption type to use | string | none | no |
| kms_key_id | The GUID for the customer-managed KMS key to use for encryption. | string | - | no |

## Outputs
* s3 bucket id - ID of the bucket
* s3 bucket arn - ARN of the bucket
* kinesis stream id - ID of the stream
* kinesis stream arn - ARN of the stream
* firehose delivery stream arn - ARN of the firehose delivery stream


## Versions

| Version | Major changes |
| ------- | ------------- |
| 1     | Created module |
| 2     | TBD |

Authors
=======

jamielljack@gmail.com