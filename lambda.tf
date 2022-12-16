resource "aws_lambda_function" "dynamodb_input_data" {
  function_name = "PetLambda-Set"
  filename      = data.archive_file.lambda_dynamodb_put.output_path
  # source_code_hash = data.archive_file.exmaple_zip_file.output_base64sha256
  role    = aws_iam_role.lambda_role.arn
  handler = "index.lambda_handler"
  runtime = "python3.9"

}