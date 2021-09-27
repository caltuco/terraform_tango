variable "lambda_notifications" {
  description = "Map of S3 bucket notifications to Lambda function"
  type        = any
  default     = {}
}

variable "create_notif_lambda" {
  type = bool
  default = false
}

variable "bucket" {
  type = string
}
