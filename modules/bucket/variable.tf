# variable "create_s3" {
#   type = bool
#   default = false
# }

variable "buckets_parameters" {
  type    = list(object({
            bucket = string,
            acl = string,
            policy = string,
            website = map(string),
            }))
          }


variable "global_tags" {
  type = map
  default = {}
  }

# variable "website" {
#   description = "Map containing static web-site hosting or redirect configuration."
#   type        = map(string)
#   default     = {}
# }

# variable "policy" {
#   description = "(Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
#   type        = string
#   default     = null
# }

# variable "acl" {
#   default = "private"
# }


variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = false
}
