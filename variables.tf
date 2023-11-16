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
    // resource definition
    service_plan = {
      name                         = ""
      os_type                      = "Linux" // defined default
      app_service_environment_id   = null
      maximum_elastic_worker_count = null
      worker_count                 = null
      per_site_scaling_enabled     = null
      zone_balancing_enabled       = null
      tags                         = {}
    }
    linux_function_app = {
      name                               = ""
      app_settings                       = null
      builtin_logging_enabled            = null
      client_certificate_enabled         = null
      client_certificate_mode            = null
      client_certificate_exclusion_paths = null
      daily_memory_time_quota            = null
      enabled                            = null
      content_share_force_disabled       = null
      functions_extension_version        = null
      https_only                         = null
      public_network_access_enabled      = null
      key_vault_reference_identity_id    = null
      storage_account_access_key         = null
      storage_account_name               = null
      storage_uses_managed_identity      = null
      storage_key_vault_secret_id        = null
      virtual_network_subnet_id          = null
      zip_deploy_file                    = null
      site_config = {
        always_on                                     = null
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
          disk_quota_mb         = null
          retention_period_days = null
        }
        cors = {
          allowed_origins     = null
          support_credentials = null
        }
        ip_restriction = {
          name                      = ""
          action                    = null
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
          action                    = null
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
        additional_login_parameters    = null
        allowed_external_redirect_urls = null
        default_provider               = null
        issuer                         = null
        runtime_version                = null
        token_refresh_extension_hours  = null
        token_store_enabled            = null
        unauthenticated_client_action  = null
        active_directory = {
          allowed_audiences          = null
          client_secret              = null
          client_secret_setting_name = null
        }
        facebook = {
          app_secret              = null
          app_secret_setting_name = null
          oauth_scopes            = null
        }
        github = {
          client_secret              = null
          client_secret_setting_name = null
          oauth_scopes               = null
        }
        google = {
          client_secret              = null
          client_secret_setting_name = null
          oauth_scopes               = null
        }
        microsoft = {
          client_secret              = null
          client_secret_setting_name = null
          oauth_scopes               = null
        }
        twitter = {
          consumer_secret              = null
          consumer_secret_setting_name = null
        }
      }
      auth_settings_v2 = {
        auth_enabled                            = null
        runtime_version                         = null
        config_file_path                        = null
        require_authentication                  = null
        unauthenticated_action                  = null
        default_provider                        = null
        excluded_paths                          = null
        require_https                           = null
        http_route_api_prefix                   = null
        forward_proxy_convention                = null
        forward_proxy_custom_host_header_name   = null
        forward_proxy_custom_scheme_header_name = null
        apple_v2 = {
          login_scopes = null
        }
        active_directory_v2 = {
          client_secret_setting_name           = null
          client_secret_certificate_thumbprint = null
          jwt_allowed_groups                   = null
          jwt_allowed_client_applications      = null
          www_authentication_disabled          = null
          allowed_groups                       = null
          allowed_identities                   = null
          allowed_applications                 = null
          login_parameters                     = null
          allowed_audiences                    = null
        }
        azure_static_web_app_v2 = {
          name_claim_type            = null
          scopes                     = null
          client_credential_method   = null
          client_secret_setting_name = null
          authorisation_endpoint     = null
          token_endpoint             = null
          issuer_endpoint            = null
          certification_uri          = null
        }
        custom_oidc_v2 = {
          name_claim_type            = null
          scopes                     = null
          client_credential_method   = null
          client_secret_setting_name = null
          authorisation_endpoint     = null
          token_endpoint             = null
          issuer_endpoint            = null
          certification_uri          = null
        }
        facebook_v2 = {
          graph_api_version = null
          login_scopes      = null
        }
        github_v2 = {
          login_scopes = null
        }
        google_v2 = {
          allowed_audiences = null
          login_scopes      = null
        }
        microsoft_v2 = {
          allowed_audiences = null
          login_scopes      = null
        }
        twitter_v2 = {}
        login = {
          logout_endpoint                   = null
          token_store_enabled               = null
          token_refresh_extension_time      = null
          token_store_path                  = null
          token_store_sas_setting_name      = null
          preserve_url_fragments_for_logins = null
          allowed_external_redirect_urls    = null
          cookie_expiration_convention      = null
          cookie_expiration_time            = null
          validate_nonce                    = null
          nonce_expiration_time             = null
        }
      }
      backup = {
        enabled = null
        schedule = {
          keep_at_least_one_backup = null
          retention_period_days    = null
          start_time               = null
        }
      }
      connection_string = {
        name = ""
      }
      identity = {
        identity_ids = null
      }
      sticky_settings = {
        app_setting_names       = null
        connection_string_names = null
      }
      storage_account = {
        name       = ""
        mount_path = null
      }
      tags = {}
    }
    static_site = {
      name     = ""
      sku_tier = "Standard" // defined default
      sku_size = "Standard" // defined default
      identity = {
        identity_ids = null
      }
      app_settings = {}
      tags         = {}
    }
  }

  // compare and merge custom and default values
  static_site_values = {
    for static_site in keys(var.static_site) :
    static_site => merge(local.default.static_site, var.static_site[static_site])
  }
  linux_function_app_values = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(local.default.linux_function_app, var.linux_function_app[linux_function_app])
  }

  // deep merge of all custom and default values
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
  linux_function_app = {
    for linux_function_app in keys(var.linux_function_app) :
    linux_function_app => merge(
      local.linux_function_app_values[linux_function_app],
      {
        for config in ["site_config"] :
        config => merge(
          merge(local.default.linux_function_app[config], local.linux_function_app_values[linux_function_app][config]),
          {
            for subconfig in ["application_stack"] :
            subconfig => lookup(var.linux_function_app[linux_function_app][config], subconfig, {}) == {} ? null : merge(
              merge(local.default.linux_function_app[config][subconfig], local.linux_function_app_values[linux_function_app][config][subconfig]),
              {
                for subsubconfig in ["docker"] :
                subsubconfig => lookup(local.linux_function_app_values[linux_function_app][config][subconfig], subsubconfig, {}) == {} ? {} : {
                  for key in keys(local.linux_function_app_values[linux_function_app][config][subconfig][subsubconfig]) :
                  key => merge(local.default.linux_function_app[config][subconfig][subsubconfig], local.linux_function_app_values[linux_function_app][config][subconfig][subsubconfig][key])
                }
              }
            )
          },
          {
            for subconfig in ["app_service_logs", "cors"] :
            subconfig => merge(local.default.linux_function_app[config][subconfig], lookup(local.linux_function_app_values[linux_function_app][config], subconfig, {}))
          },
          {
            for subconfig in ["ip_restriction", "scm_ip_restriction"] :
            subconfig => lookup(var.linux_function_app[linux_function_app][config], subconfig, {}) == {} ? {} : {
              for key in keys(local.linux_function_app_values[linux_function_app][config][subconfig]) :
              key => merge(
                merge(local.default.linux_function_app[config][subconfig], local.linux_function_app_values[linux_function_app][config][subconfig][key]),
                {
                  for subsubconfig in ["headers"] :
                  subsubconfig => merge(local.default.linux_function_app[config][subconfig][subsubconfig], lookup(local.linux_function_app_values[linux_function_app][config][subconfig][key], subsubconfig, {}))
                }
              )
            }
          }
        )
      },
      {
        for config in ["auth_settings"] :
        config => keys(local.linux_function_app_values[linux_function_app][config]) == keys(local.default.linux_function_app[config]) ? null : merge(
          merge(local.default.linux_function_app[config], lookup(local.linux_function_app_values[linux_function_app], config, {})),
          {
            for subconfig in [
              "active_directory",
              "facebook",
              "github",
              "google",
              "microsoft",
              "twitter"
            ] :
            subconfig => merge(local.default.linux_function_app[config][subconfig], lookup(local.linux_function_app_values[linux_function_app][config], subconfig, {}))
          }
        )
      },
      {
        for config in ["auth_settings_v2"] :
        config => keys(local.linux_function_app_values[linux_function_app][config]) == keys(local.default.linux_function_app[config]) ? null : merge(
          merge(local.default.linux_function_app[config], lookup(local.linux_function_app_values[linux_function_app], config, {})),
          {
            for subconfig in [
              "apple_v2",
              "active_directory_v2",
              "azure_static_web_app_v2",
              "custom_oidc_v2",
              "facebook_v2",
              "github_v2",
              "google_v2",
              "microsoft_v2",
              "twitter_v2"
            ] :
            subconfig => merge(local.default.linux_function_app[config][subconfig], lookup(local.linux_function_app_values[linux_function_app][config], subconfig, {}))
          }
        )
      },
      {
        for config in ["identity", "sticky_settings"] :
        config => merge(local.default.linux_function_app[config], lookup(local.linux_function_app_values[linux_function_app], config, {}))
      },
      {
        for config in ["backup"] :
        config => keys(local.linux_function_app_values[linux_function_app][config]) == keys(local.default.linux_function_app[config]) ? null : merge(
          merge(local.default.linux_function_app[config], local.linux_function_app_values[linux_function_app][config]),
          {
            for subconfig in ["schedule"] :
            subconfig => merge(local.default.linux_function_app[config][subconfig], local.linux_function_app_values[linux_function_app][config][subconfig])
          }
        )
      },
      {
        for config in ["connection_string", "storage_account"] :
        config => keys(local.linux_function_app_values[linux_function_app][config]) == keys(local.default.linux_function_app[config]) ? {} : {
          for key in keys(local.linux_function_app_values[linux_function_app][config]) :
          key => merge(local.default.linux_function_app[config], local.linux_function_app_values[linux_function_app][config][key])
        }
      }
    )
  }
}
