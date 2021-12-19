output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = element(module.lambda.lambda_function_arn.*, 0)
}
