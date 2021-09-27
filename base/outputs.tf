output "bucket-name" {
  value = aws_s3_bucket.tf-state.bucket
}


output "dynamodb-table" {
  value = aws_dynamodb_table.dynamodb-terraform-state-lock.name
}
