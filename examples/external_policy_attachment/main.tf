provider "aws" {
  region = "us-east-2"
}

locals {
  resource_name_prefix = "orion"
}

module "lambda_basic_policy" {
  source             = "git::git@ssh.dev.azure.com:v3/orionadvisor/DevOps/tf-module-iam-policy?ref=v1.0.0"
  policy_name        = "${local.resource_name_prefix}-lmdb-policy"
  policy_description = "Managed by TF"
  statements = [
    {
      sid    = "Logging"
      effect = "Allow"
      actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      resources     = ["*"]
      not_resources = []
      condition     = []
      principals    = []
    },
    {
      sid    = "xray"
      effect = "Allow"
      actions = [
        "xray:PutTraceSegments",
        "xray:PutTelemetryRecords",
        "xray:GetSamplingRules",
        "xray:GetSamplingTargets",
        "xray:GetSamplingStatisticSummaries"
      ]
      resources     = ["*"]
      not_resources = []
      condition     = []
      principals    = []
    }
  ]
}

module "lambda_role" {
  source    = "git::git@ssh.dev.azure.com:v3/orionadvisor/DevOps/tf-module-iam-role?ref=v1.0.0"
  role_name = "${local.resource_name_prefix}-role"
  trusted_identifier = {
    type        = "Service"
    identifiers = ["lambda.amazonaws.com"]
  }
}


resource "aws_iam_role_policy_attachment" "queue_s3_attachment_to_lambda" {
  role = module.lambda_role.output.role.name
  #role       = aws_iam_role.lambda_role.name
  policy_arn = module.lambda_basic_policy.output.policy_arn
}