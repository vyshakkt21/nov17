resource "azurerm_resource_group" "rg1" {
name= "${local.resoruce_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
location = var.rg_location
tags = local.common_tags
  
}