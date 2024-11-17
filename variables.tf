variable "business_division" {
    description = "Businees diviiosn of larg org"
     type= string
     default = "sap"
  
}
variable "environment" {
description = "Env variable used as prefix" 
type = string
default = "prod"
}

variable "resource_group_name" {
 description = "Resoruce group name" 
 default = "test-default-rg"
}

variable "rg_location" {
    
description = "Location"  
default = "eastus"
}