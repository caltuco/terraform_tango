#setting region
region = "us-east-1"
#setting global tags
global_tags = {
  DEV_NAME = "Luis"
  Terraform = "yes"
}
public_acl = "public-read"

public_bucket_name = "public-bucket-caltuco"

private_bucket_name = "private-bucket-caltuco"


####### DYNAMODB VARIABLES

table_name = "table_1"
hash_key = "ID"
range_key = "name"
read_capacity = 1
write_capacity = 2
billing_mode = "PROVISIONED"
