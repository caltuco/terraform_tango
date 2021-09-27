module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "2.18.0"


  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "handler.lambda_handler"
  runtime       = "python3.8"

  source_path = "python_code/handler.py"

  environment_variables = {
    DYNAMO_TABLE      = module.dynamobd.dynamodb[0].id
  }

  attach_policy_jsons = true
  policy_jsons = [file("${path.module}/policy/lambda_policy1.json"),file("${path.module}/policy/lambda_policy2.json")]
  number_of_policy_jsons = 2

  tags = var.global_tags
}
