output "virtual_network_name" {
  description = "virtual network name"
  value = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
    description = "Virtual networ ID"
    value = azurerm_virtual_network.vnet.id
  
}

output "web_subnet_name" {
  description = "web subnet name" 
  value = azurerm_subnet.websubnet.name
}

output "web_subnet_id" {
    description = "Web subnet ID"
    value = azurerm_subnet.websubnet.id  
}

output "network_security_group_name" {
    description = "network security group"
    value = azurerm_network_security_group.websubnet_nsg.name  
}
