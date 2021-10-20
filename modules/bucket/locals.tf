locals = {
    policy = templatefile("${path.module}/policy/policy.tpl", { bucket_name = var.public_bucket_name })
}
