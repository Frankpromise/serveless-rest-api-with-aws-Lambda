# Create an IAM policy document for the assume role policy
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# Create an IAM policy document for the AmazonDynamoDBFullAccess policy
data "aws_iam_policy_document" "dynamodb_full_access" {
  statement {
    actions   = ["dynamodb:*"]
    resources = ["*"]
  }
}

# Create an IAM role for the Lambda
# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "lambda_function_role"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Attach the AmazonDynamoDBFullAccess policy to the IAM role
resource "aws_iam_role_policy_attachment" "dynamodb_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.dynamodb_policy_arn
}