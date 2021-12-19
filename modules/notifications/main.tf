
resource "aws_s3_bucket_notification" "this" {
  count = var.create_notif_lambda && (length(var.lambda_notifications) > 0) ? 1 : 0

  bucket = var.bucket

  dynamic "lambda_function" {
    for_each = var.lambda_notifications

    content {
      lambda_function_arn = lambda_function.value.lambda_function_arn
      events              = lambda_function.value.lambda_function_events
      filter_prefix       = lookup(lambda_function.value, "filter_prefix", null)
      filter_suffix       = lookup(lambda_function.value, "filter_suffix", null)
    }
  }
}
