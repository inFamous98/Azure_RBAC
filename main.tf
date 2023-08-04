resource "azurerm_policy_set_definition" "example_policy_set" {
  name         = var.policy_set_name
  display_name = var.policy_display_name
  description  = var.policy_description
  policy_type  = "Custom"

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.example_policy.id
  }
}

resource "azurerm_policy_definition" "example_policy" {
  name         = var.policy_definition_name
  display_name = var.policy_display_name
  description  = var.policy_description
  policy_type  = "Custom"
  mode         = "Indexed"
  policy_rule  = jsonencode(var.policy_rule)
}

variable "role_assignments" {
  type = map(object({
    scope            = string
    principal_id     = string
    role_definition_id = string
  }))
  description = "Role assignments to be created"
  default = {}
}

resource "azurerm_role_assignment" "example_assignment" {
  for_each = var.role_assignments

  scope            = each.value.scope
  principal_id     = each.value.principal_id
  role_definition_name = each.value.role_definition_id
}
