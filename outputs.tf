output "service_plan" {
  description = "Outputs all attributes of resource_type."
  value = {
    for service_plan in keys(azurerm_service_plan.service_plan) :
    service_plan => {
      for key, value in azurerm_service_plan.service_plan[service_plan] :
      key => value
    }
  }
}

output "linux_function_app" {
  description = "Outputs all attributes of resource_type."
  value = {
    for linux_function_app in keys(azurerm_linux_function_app.linux_function_app) :
    linux_function_app => {
      for key, value in azurerm_linux_function_app.linux_function_app[linux_function_app] :
      key => value
    }
  }
}

output "static_site" {
  description = "Outputs all attributes of resource_type."
  value = {
    for static_site in keys(azurerm_static_site.static_site) :
    static_site => {
      for key, value in azurerm_static_site.static_site[static_site] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      service_plan = {
        for key in keys(var.service_plan) :
        key => local.service_plan[key]
      }
      linux_function_app = {
        for key in keys(var.linux_function_app) :
        key => local.linux_function_app[key]
      }
      static_site = {
        for key in keys(var.static_site) :
        key => local.static_site[key]
      }
    }
    local = {
      linux_function_app_values  = local.linux_function_app_values
      linux_function_app_default = local.default.linux_function_app
    }
  }
}
