#setting region
region = "us-east-1"
#setting bucket name for terraform state
bucket-tfstate = "tf-state"


global_tags = {
  Environment = "dev"
  Terraform = "yes"
}
