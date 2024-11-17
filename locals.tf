locals {
  owners= var.business_division
  environment=var.environment
  resource_group_name= var.resource_group_name
  rg_location= var.rg_location
resoruce_name_prefix= "${var.business_division}-${var.environment}"  
  common_tags = {
    owners=local.owners
    environment=local.environment
      }
    
   }
   