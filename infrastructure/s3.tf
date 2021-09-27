module "bucket_website" {
  source = "../modules/bucket"

  create_s3 = true


  custom_bucket_name = var.public_bucket_name

  acl = var.public_acl

  policy = templatefile("${path.module}/policy/policy.tpl", { bucket_name = var.public_bucket_name })

  website = {
    index_document  = "index.html"
    error_document  = "error.html"
  }

}

module "bucket_private" {
  source = "../modules/bucket"

  create_s3 = true



  custom_bucket_name = var.private_bucket_name

  block_public_acls   = true
  block_public_policy = true
  restrict_public_buckets = true
  ignore_public_acls = true

}


module "bucket_notif_lambda" {
  source = "../modules/notifications"

  create_notif_lambda = true

  bucket = module.bucket_private.bucket_this[0].bucket


  lambda_notifications = [{
    lambda_function_arn     = module.lambda.lambda_function_arn
    lambda_function_events  = ["s3:ObjectCreated:Put"]
    filter_prefix           = "image/"
    #filter_suffix           = ".jpeg"
  }]
}
