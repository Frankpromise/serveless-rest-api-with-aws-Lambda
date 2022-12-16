resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "Pets"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name = "dynamodb-table-Pets"
  }
}