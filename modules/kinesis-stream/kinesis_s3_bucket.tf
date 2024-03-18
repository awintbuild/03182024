resource "aws_s3_bucket" "firehose_target" {
  bucket = "firehose-target-bucket"
}

resource "aws_s3_bucket_acl" "firehose_target" {
  bucket = aws_s3_bucket.firehose_target.id
  acl    = "private"
}
