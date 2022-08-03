terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "appservice-rg" {
  name = "${var.app_name}-${var.environment}_AppService-rg"
  location = var.location
 

# Create app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name = "${var.app_name}-${var.environment}_AppService-plan"
  location = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  kind = "Linux"
  reserved = true
 
  sku {
    tier = "Standard"
    size = "S1"
  }
 
}


# Create app service
resource "azurerm_app_service" "app-service" {
  name = "${var.app_name}-${var.environment}"
  location = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id  
 
 
  app_settings = {
    "WEBSITES_PORT" = var.app_port
  }
 
}


output "app_service_url" {
  value       = azurerm_app_service.app-service.default_site_hostname
  description = "Default URL to access the app service." 
}
