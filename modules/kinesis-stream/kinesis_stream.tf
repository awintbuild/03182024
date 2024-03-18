resource "aws_kinesis_stream" "affiliate_stream" { 
  // A name to identify the stream
  name = "exampleStream"

  // The number of shard that the stream will use A shard is a unit of throughput capacity.
  shard_count = var.kinesis_shard_count

  // Length of time data records are accessible after they are added to the stream
  retention_period = var.kinesis_retention_period

  // A list of shard-level CloudWatch metrics which can be enabled for the stream
  shard_level_metrics = var.kinesis_shard_level_metrics

  stream_mode_details {
   stream_mode = var.kinesis_stream_mode # On demand because no capacity planning required and it autoscales
 }

  // A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error.
  enforce_consumer_deletion = var.kinesis_enforce_consumer_deletion

  // The encryption type to use
  encryption_type = var.kinesis_encryption_type

  // The GUID for the customer-managed KMS key to use for encryption.
  kms_key_id = var.kinesis_kms_master_key_id

  // A mapping of tags  to assign to the resource
  tags = {
    Environment = "Dev"
  }
}
