variable "app_name" {
	  type        = string
	  description = "This variable defines the application name used to build resources.  It must be unique on Azure."
	}
	

	variable "app_port" {
	  type        = string
	  description = "Port used by the web app"
	  default     = "8080"
	}
	
	variable "environment" {
	  type        = string
	  description = "This variable defines the environment to be built"
	}
	

	variable "location" {
	  type        = string
	  description = "Azure region where the resource group will be created"
	  default     = "us east"
	}
	

	
	variable "description" {
	  type        = string
	  description = "Provide a description of the resource"
	}
