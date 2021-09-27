output "dynamo_ouput" {

  value = module.dynamobd.dynamodb[0].id

}
