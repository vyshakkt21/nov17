resource "azurerm_virtual_network" "vnet" {
name = "${local.resoruce_name_prefix}-${var.vnet_name}"
resource_group_name = azurerm_resource_group.rg1.name
location = local.rg_location
address_space =var.vnet_address_space
tags= local.common_tags
}  