data "aws_iam_policy_document" "bucket_policy_document" {
  statement {
    sid = "PublicReadGetObject"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.public_bucket_name}/*",
    ]
  }


}

resource "aws_iam_policy" "bucket_policy" {
  name   = "s3_public_access_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}
