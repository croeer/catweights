provider "aws" {
  region = "eu-central-1"
}

resource "aws_dynamodb_table" "cat_weight_table" {
  name           = "catweights"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key  = "cat_id"
  range_key = "timestamp"

  attribute {
    name = "cat_id"
    type = "S"
  }

  attribute {
    name = "timestamp"
    type = "S"
  }

  attribute {
    name = "weight"
    type = "N"
  }

  global_secondary_index {
    name            = "weight_index"
    hash_key        = "weight"
    projection_type = "ALL"
    write_capacity  = 1
    read_capacity   = 1
  }
}

output "table_name" {
  value = aws_dynamodb_table.cat_weight_table.name
}
