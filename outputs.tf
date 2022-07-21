output "service_plan" {
  description = "azurerm_service_plan"
  value = {
    for service_plan in keys(azurerm_service_plan.service_plan) :
    service_plan => {
      id   = azurerm_service_plan.service_plan[service_plan].id
      name = azurerm_service_plan.service_plan[service_plan].name
    }
  }
}

output "linux_function_app" {
  description = "azurerm_linux_function_app"
  value = {
    for linux_function_app in keys(azurerm_linux_function_app.linux_function_app) :
    linux_function_app => {
      id   = azurerm_linux_function_app.linux_function_app[linux_function_app].id
      name = azurerm_linux_function_app.linux_function_app[linux_function_app].name
      default_hostname = azurerm_linux_function_app.linux_function_app[linux_function_app].default_hostname
    }
  }
}
