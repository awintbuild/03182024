# Output variable definitions
output "s3_bucket_id" {
  value = aws_s3_bucket.firehose_target.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.firehose_target.arn
}

output "kinesis_stream_id" {
  value = aws_kinesis_stream.affiliate_stream.id
}

output "kinesis_stream_arn" {
  value = aws_kinesis_stream.affiliate_stream.arn
}

output "kinesis_firehose_delivery_stream_arn" {
  value = aws_kinesis_firehose_delivery_stream.affiliate_firehose.arn
}
