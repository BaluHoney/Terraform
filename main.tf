# Create a Resource Group
data "azurerm_resource_group" "rg1" {
  name     = var.rgname
}

# Create a Log Analytical Workspace
data "azurerm_log_analytics_workspace" "LAW1" {
  name                = "Example-LAW"
  resource_group_name = data.azurerm_resource_group.rg1.name
}

# Create a Application Insights
resource "azurerm_application_insights" "appinsight1" {
  name                = var.prefix
  location            = data.azurerm_resource_group.rg1.location
  resource_group_name = data.azurerm_resource_group.rg1.name
  workspace_id        = data.azurerm_log_analytics_workspace.LAW1.id
  application_type    = "web"
}

output "instrumentation_key" {
  value = azurerm_application_insights.appinsight1.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appinsight1.app_id
}