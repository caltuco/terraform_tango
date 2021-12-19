output "s3_public_policy_json" {
  value = aws_iam_policy.bucket_policy.policy
}
