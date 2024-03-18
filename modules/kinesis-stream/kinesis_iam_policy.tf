resource "aws_iam_policy" "firehose_to_s3_policy" {
 name = "firehose_to_s3_policy"
 policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Effect = "Allow"
       Action = [
       "s3:AbortMultipartUpload",
       "s3:GetBucketLocation",
       "s3:GetObject",
       "s3:ListBucket",
       "s3:ListBucketMultipartUploads",
       "s3:PutObject"
       ],
       Resource = [
       "${aws_s3_bucket.firehose_target.arn}",
       "${aws_s3_bucket.firehose_target.arn}/*"
       ]
     }
   ]
 })
}

resource "aws_iam_role_policy_attachment" "firehose_to_s3_attach" {
 role = aws_iam_role.firehose_role.name
 policy_arn = aws_iam_policy.firehose_to_s3_policy.arn
}