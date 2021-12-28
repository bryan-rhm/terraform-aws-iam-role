variable "name" {
  description = "Name for the role"
  type        = string
}

variable "statement_id" {
  description = "Identifier for a policy statement (Statement ID)."
  default     = null
  type        = string
}

variable "description" {
  description = "Description for the IAM role"
  default     = "Created by terraform"
  type        = string
}

variable "trusted_identifier" {
  description = "Entity allowed to assume the role"
  type = object({
    type        = string       # Ex: AWS
    identifiers = list(string) # Ex: Account id (1234424) | AWS service  ec2.amazonaws.com
  })
}

variable "managed_policy_arns" {
  description = "List of ARNs of IAM policies to attach"
  default     = null
  type        = list(string)
}

variable "conditions" {
  type = list(object({
    condition = object({
      test     = string
      variable = string
      values   = list(string)
    })
  }))
  description = "Assume Role Conditions"
  default     = []
}
