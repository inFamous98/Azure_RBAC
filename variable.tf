variable "policy_set_name" {
  type        = string
  description = "Name of the policy set"
  default     = "example-policy-set"
}

variable "policy_definition_name" {
  type        = string
  description = "Name of the policy definition"
  default     = "example-policy-definition"
}

variable "policy_display_name" {
  type        = string
  description = "Display name of the policy definition"
  default     = "Example Policy Definition"
}

variable "policy_description" {
  type        = string
  description = "Description of the policy definition"
  default     = "An example policy definition"
}

variable "policy_rule" {
  type        = any
  description = "Policy rule definition"
  default = {
    if = [
      {
        field  = "location"
        equals = "West Europe"
      }
    ]
    then = {
      effect = "deny"
    }
  }
}