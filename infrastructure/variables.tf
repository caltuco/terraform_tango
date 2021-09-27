variable "region" {
}

variable "public_bucket_name" {
  type = string
  }

variable "public_acl" {
}

variable "private_bucket_name" {
}

## DYNAMO VARIABLES
variable "table_name" {
}

variable "hash_key" {
}
variable "range_key" {
}

variable "read_capacity"{
}

variable "write_capacity"{
}

variable "billing_mode"{
}

variable "global_tags" {
  type = map
}
