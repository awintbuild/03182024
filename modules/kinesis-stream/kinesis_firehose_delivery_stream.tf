resource "aws_kinesis_firehose_delivery_stream" "affiliate_firehose" {
  //A name to identify the stream
  name = "exampleFirehose"

  //This is the destination to where the data is delivered
  destination = var.kinesis_destination

  extended_s3_configuration {
    //The ARN of the AWS credentials.
    role_arn = aws_iam_role.firehose_role.arn

    //The ARN of the S3 bucket
    bucket_arn = aws_s3_bucket.firehose_target.arn

    //Buffer incoming data to the specified size, in MBs, before delivering it to the destination.
    buffering_size = var.kinesis_buffering_size

    //Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination.
    buffering_interval = var.kinesis_buffering_interval

    //The compression format
    compression_format = var.kinesis_compression_format
  }

  kinesis_source_configuration {
    role_arn = aws_iam_role.firehose_role.arn
    kinesis_stream_arn = aws_kinesis_stream.kinesis.arn
  }

  tags = {
    Environment = "Dev"
 }
}