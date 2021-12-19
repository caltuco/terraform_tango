resource "aws_s3_bucket" "this" {
  for_each = { for k in var.buckets_parameters : k.bucket => k}


  bucket   = each.value.bucket
  acl    = each.value.acl

  policy = each.value.policy == "" ? null : templatefile(each.value.policy, { bucket_name = each.value.bucket })

  dynamic "website" {
   for_each = length(keys(each.value.website)) == 0 ? [] : [each.value.website]

   content {
     index_document           = lookup(each.value.website, "index_document", null)
     error_document           = lookup(each.value.website, "error_document", null)
     redirect_all_requests_to = lookup(each.value.website, "redirect_all_requests_to", null)
     routing_rules            = lookup(each.value.website, "routing_rules", null)
   }
 }

  tags = var.global_tags
}



# resource "aws_s3_bucket_public_access_block" "this" {
#   count = var.create_s3 ? 1 : 0
#   bucket = aws_s3_bucket.this[0].id
#
#   block_public_acls   = var.block_public_acls
#   block_public_policy = var.block_public_policy
#   ignore_public_acls = var.ignore_public_acls
#   restrict_public_buckets = var.restrict_public_buckets
#
# }
