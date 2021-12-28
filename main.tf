data "aws_iam_policy_document" "aws_trust_policy" {
  statement {
    sid = var.statement_id
    actions = ["sts:AssumeRole"]

    principals {
      type        = var.trusted_identifier.type
      identifiers = var.trusted_identifier.identifiers
    }

    dynamic "condition" {
      for_each = var.conditions
      content {
        test     = lookup(condition.value.condition, "test", null)
        variable = lookup(condition.value.condition, "variable", null)
        values   = lookup(condition.value.condition, "values", null)
      }
    }
  }
}

resource "aws_iam_role" "role" {
  description           = var.description
  name                  = var.name
  assume_role_policy    = data.aws_iam_policy_document.aws_trust_policy.json
  managed_policy_arns   = var.managed_policy_arns
  force_detach_policies = true
}
