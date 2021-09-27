module "dynamobd" {
  source = "../modules/dynamo"

  create_table = true

  table_name       = var.table_name
  billing_mode     = var.billing_mode
  hash_key         = var.hash_key
  range_key        = var.range_key
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity


  autoscaling_read = {
  scale_in_cooldown  = 50
  scale_out_cooldown = 40
  target_value       = 50
  max_capacity       = 5
}

autoscaling_write = {
  scale_in_cooldown  = 50
  scale_out_cooldown = 40
  target_value       = 70
  max_capacity       = 10
}

  attributes = [
    {
      name = "ID"
      type = "S"
    },
    {
      name = "name"
      type = "S"
    }
  ]




}
