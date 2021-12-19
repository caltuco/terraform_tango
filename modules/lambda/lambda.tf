module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "2.18.0"


  function_name = var.function_name
  description   = var.description
  handler       = var.handler
  runtime       = var.runtime

  source_path = var.source_path

  environment_variables = var.environment_variables

  attach_policy_jsons = var.attach_policy_jsons
  policy_jsons = var.policy_jsons
  number_of_policy_jsons = var.number_of_policy_jsons


}
