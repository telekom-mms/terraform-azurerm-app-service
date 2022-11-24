variable "service_plan" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "linux_function_app" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "static_site" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    service_plan = {
      name                         = ""
      os_type                      = "Linux"
      app_service_environment_id   = null
      maximum_elastic_worker_count = null
      worker_count                 = null
      per_site_scaling_enabled     = false
      zone_balancing_enabled       = false
      tags                         = {}
    }
    linux_function_app = {
      name                            = ""
      app_settings                    = null
      builtin_logging_enabled         = null
      client_certificate_enabled      = null
      client_certificate_mode         = "Required"
      connection_string               = null
      daily_memory_time_quota         = null
      enabled                         = null
      content_share_force_disabled    = null
      functions_extension_version     = null
      https_only                      = true
      key_vault_reference_identity_id = null
      storage_account_access_key      = null
      storage_account_name            = null
      storage_uses_managed_identity   = null
      storage_key_vault_secret_id     = null
      site_config = {
        always_on                                     = false
        api_definition_url                            = null
        api_management_api_id                         = null
        app_command_line                              = null
        app_scale_limit                               = null
        application_insights_connection_string        = null
        application_insights_key                      = null
        container_registry_managed_identity_client_id = null
        container_registry_use_managed_identity       = null
        default_documents                             = null
        elastic_instance_minimum                      = null
        ftps_state                                    = null
        health_check_path                             = null
        health_check_eviction_time_in_min             = null
        http2_enabled                                 = null
        load_balancing_mode                           = null
        managed_pipeline_mode                         = null
        minimum_tls_version                           = null
        pre_warmed_instance_count                     = null
        remote_debugging_enabled                      = null
        remote_debugging_version                      = null
        runtime_scale_monitoring_enabled              = null
        scm_minimum_tls_version                       = null
        scm_use_main_ip_restriction                   = null
        use_32_bit_worker                             = null
        vnet_route_all_enabled                        = null
        websockets_enabled                            = null
        worker_count                                  = null
        application_stack = {
          dotnet_version              = null
          use_dotnet_isolated_runtime = null
          java_version                = null
          node_version                = null
          python_version              = null
          powershell_core_version     = null
          use_custom_runtime          = null
          docker = {
            registry_username = null
            registry_password = null
          }
        }
        app_service_logs = {
          disk_quota_mb         = ""
          retention_period_days = null
        }
        cors = {
          allowed_origins     = null
          support_credentials = false
        }
        ip_restriction = {
          name                      = ""
          action                    = "Allow"
          ip_address                = null
          priority                  = null
          service_tag               = null
          virtual_network_subnet_id = null
          headers = {
            x_azure_fdid      = null
            x_fd_health_probe = null
            x_forwarded_for   = null
            x_forwarded_host  = null
          }
        }
        scm_ip_restriction = {
          name                      = ""
          action                    = "Allow"
          ip_address                = null
          priority                  = null
          service_tag               = null
          virtual_network_subnet_id = null
          headers = {
            x_azure_fdid      = null
            x_fd_health_probe = null
            x_forwarded_for   = null
            x_forwarded_host  = null
          }
        }
      }
      auth_settings = {
        enabled                        = false
        additional_login_parameters    = null
        allowed_external_redirect_urls = null
        default_provider               = null
        issuer                         = null
        runtime_version                = null
        token_refresh_extension_hours  = null
        token_store_enabled            = null
        unauthenticated_client_action  = null
        active_directory = {
          client_id                  = ""
          allowed_audiences          = null
          client_secret              = null
          client_secret_setting_name = null
        }
        facebook = {
          app_id                  = ""
          app_secret              = null
          app_secret_setting_name = null
          oauth_scopes            = null
        }
        github = {
          client_id                  = ""
          client_secret              = null
          client_secret_setting_name = null
          oauth_scopes               = null
        }
        google = {
          client_id                  = ""
          client_secret              = null
          client_secret_setting_name = null
          oauth_scopes               = null
        }
        microsoft = {
          client_id                  = ""
          client_secret              = null
          client_secret_setting_name = null
          oauth_scopes               = null
        }
        twitter = {
          consumer_key                 = ""
          consumer_secret              = null
          consumer_secret_setting_name = null
        }
      }
      backup = {
        name                = ""
        storage_account_url = ""
        enabled             = null
        schedule = {
          keep_at_least_one_backup = null
          retention_period_days    = null
          start_time               = null
        }
      }
      connection_string = {
        name = ""
        type = ""
      }
      identity = {
        type         = ""
        identity_ids = null
      }
      sticky_settings = {
        app_setting_names       = null
        connection_string_names = null
      }
      tags = {}
    }
    static_site = {
      name     = ""
      sku_tier = "Standard"
      sku_size = "Standard"
      identity = {
        type         = ""
        identity_ids = null
      }
    }
  }

  # compare and merge custom and default values
  linux_function_app_values = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(local.default.linux_function_app, var.linux_function_app[linux_function_app])
  }
  linux_function_app_site_config_values = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(local.default.linux_function_app.site_config, local.linux_function_app_values[linux_function_app].site_config)
  }
  linux_function_app_auth_settings_values = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(local.default.linux_function_app.auth_settings, local.linux_function_app_values[linux_function_app].auth_settings)
  }
  linux_function_app_backup_values = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(local.default.linux_function_app.backup, local.linux_function_app_values[linux_function_app].backup)
  }
  static_site_values = {
    for static_site in keys(var.static_site) :
    static_site => merge(local.default.static_site, var.static_site[static_site])
  }
  # merge all custom and default values
  linux_function_app = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(
      local.linux_function_app_values[linux_function_app],
      {
        site_config = merge(
          local.linux_function_app_site_config_values[linux_function_app],
          {
            for config in ["application_stack", "app_service_logs", "cors", "ip_restriction", "scm_ip_restriction"] :
            config => merge(local.default.linux_function_app.site_config[config], local.linux_function_app_site_config_values[linux_function_app][config])
          }
        )
      },
      {
        auth_settings = merge(
          local.linux_function_app_auth_settings_values[linux_function_app],
          {
            for config in ["active_directory", "facebook", "github", "google", "microsoft", "twitter"] :
            config => merge(local.default.linux_function_app.auth_settings[config], local.linux_function_app_auth_settings_values[linux_function_app][config])
          }
        )
      },
      {
        backup = merge(
          local.linux_function_app_backup_values[linux_function_app],
          {
            for config in ["schedule"] :
            config => merge(local.default.linux_function_app.backup[config], local.linux_function_app_backup_values[linux_function_app][config])
          }
        )
      },
      {
        for config in ["connection_string", "identity", "sticky_settings"] :
        config => merge(local.default.linux_function_app[config], local.linux_function_app_values[linux_function_app][config])
      }
    )
  }
  service_plan = {
    for service_plan in keys(var.service_plan) :
    service_plan => merge(local.default.service_plan, var.service_plan[service_plan])
  }
  static_site = {
    for static_site in keys(var.static_site) :
    static_site => merge(
      local.static_site_values[static_site],
      {
        for config in ["identity"] :
        config => merge(local.default.static_site[config], local.static_site_values[static_site][config])
      }
    )
  }
}
