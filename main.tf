terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "e374879d-7844-4b10-83dd-6e450658f1ce"
  client_id = "3b7874b6-c0e2-4b78-a5de-16ae427d2827"
  client_secret = "nke8Q~YWVJDrYy1OWhc_eqyMfjvXBDmBi~_ftdqc"
  tenant_id = "433b4850-5a52-4d45-9df6-b17fdd319273"
  features {}
}

module "module_resourcegroup" {
    source = "./ResourceGroup"
    rgname = "ExampleRG12345"
}

module "module_Loganalyticsworkspace" {
    source = "./LogAnalyticsWorkspace"
    prefix = "Example-LAW" 
}

module "module_appinsights" {
    source = "./Appinsights"
    prefix = "Example-APPINSIGHTS"
    rgname = "ExampleRG12345"
}

module "module_logicapp" {
    source = "./Logicapp"
    prefix = "LOGICAPP-Example"
    rgname = "ExampleRG12345"
}

module "module_functionapp" {
    source = "./Functionapp"
    prefix = "functionappexple"
    rgname = "ExampleRG12345"
}