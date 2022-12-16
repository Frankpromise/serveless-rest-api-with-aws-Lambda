data "archive_file" "lambda_dynamodb_put" {
  type        = "zip"
  source_file = "${path.module}/index.py"
  output_path = "PetLambdaSet.zip"

}