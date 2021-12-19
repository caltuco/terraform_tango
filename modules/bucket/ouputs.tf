output "bucket_id" {
  value = aws_s3_bucket.this["terragrunt-private"].id
}

output "bucket_arn" {
  value = aws_s3_bucket.this["terragrunt-private"].arn
}
