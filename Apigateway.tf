# Create the REST API Gateway
resource "aws_api_gateway_rest_api" "Pets_api" {
  name        = "Pets_api"
  description = "My API Gateway"

  # Attach the OpenAPI definition
  body = file("API.json")

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = {
    "Observability" = "true"
  }
}

# Create a resource for the API Gateway
resource "aws_api_gateway_resource" "my_resource" {
  rest_api_id = aws_api_gateway_rest_api.Pets_api.id
  parent_id   = aws_api_gateway_rest_api.Pets_api.root_resource_id
  path_part   = "{proxy+}"
}
