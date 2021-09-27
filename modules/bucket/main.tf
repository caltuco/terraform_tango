resource "aws_s3_bucket" "this" {
  count = var.create_s3 ? 1 : 0

  bucket   = var.custom_bucket_name
  acl    = var.acl

  policy = var.policy

  dynamic "website" {
   for_each = length(keys(var.website)) == 0 ? [] : [var.website]

   content {
     index_document           = lookup(website.value, "index_document", null)
     error_document           = lookup(website.value, "error_document", null)
     redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
     routing_rules            = lookup(website.value, "routing_rules", null)
   }
 }

  tags = var.global_tags
}



resource "aws_s3_bucket_public_access_block" "this" {
  count = var.create_s3 ? 1 : 0
  bucket = aws_s3_bucket.this[0].id

  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
  ignore_public_acls = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

}
