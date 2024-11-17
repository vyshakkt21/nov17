resource "azurerm_subnet" "websubnet" {
  name = "${var.vnet_name}-${var.web_subnet_name}"
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.web_subnet_address
}

resource "azurerm_network_security_group" "websubnet_nsg" {
    name = "${azurerm_subnet.websubnet.name}-nsg"
    location =azurerm_resource_group.rg1.location 
    resource_group_name = azurerm_resource_group.rg1.name

}

resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {
  subnet_id = azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.websubnet_nsg.id
  depends_on = [ azurerm_network_security_rule.nsgrule ]
  
}
locals {
  web_inbound_ports_map={
    "100" : "80",
    "110" :"443",
    "120" : "22"
  }
}
resource "azurerm_network_security_rule" "nsgrule" {
  for_each = local.web_inbound_ports_map
  name                        = "Rule_port_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg1.name
  network_security_group_name = azurerm_network_security_group.websubnet_nsg.name 
  
}