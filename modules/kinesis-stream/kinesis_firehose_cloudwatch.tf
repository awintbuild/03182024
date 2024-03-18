resource "aws_cloudwatch_dashboard" "firehose_dashboard" {
 dashboard_name = "FirehoseMonitoring"

 dashboard_body = jsonencode({
   widgets = [
     {
       type = "metric"
       properties = {
         metrics = [
           ["AWS/Firehose", 
           "IncomingRecords", 
           "DeliveryStreamName", 
           aws_kinesis_firehose_delivery_stream.affiliate_firehose.name,
           ".", 
           "DeliveryToS3.Bytes", 
           ".", 
           "."
           ]
         ]
         view = "timeSeries"
         stacked = false
       }
     }
   ]
 })
}

resource "aws_cloudwatch_metric_alarm" "firehose_incoming_records_alarm" {
 alarm_name = "high-incoming-records"
 comparison_operator = var.comparison_operator
 evaluation_periods = var.evaluation_periods
 metric_name = var.metric_name
 namespace = var.namespace
 period = var.period
 statistic = var.statistic
 threshold = var.threshold
 alarm_description = "Alarm when the number of incoming records is too high"
 
 dimensions = {
    DeliveryStreamName = aws_kinesis_firehose_delivery_stream.affiliate_firehose.name
 }
 alarm_actions = [/* Add notification action, e.g., SNS topic ARN */]
}