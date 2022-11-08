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
      id               = azurerm_linux_function_app.linux_function_app[linux_function_app].id
      name             = azurerm_linux_function_app.linux_function_app[linux_function_app].name
      default_hostname = azurerm_linux_function_app.linux_function_app[linux_function_app].default_hostname
    }
  }
}

output "static-site" {
  description = "azurerm_static_site results"
  value = {
    for static_site in keys(azurerm_static_site.static_site) :
    static_site => {
      id                = azurerm_static_site.static_site[static_site].id
      api_key           = azurerm_static_site.static_site[static_site].api_key
      default_host_name = azurerm_static_site.static_site[static_site].default_host_name
    }
  }
}
