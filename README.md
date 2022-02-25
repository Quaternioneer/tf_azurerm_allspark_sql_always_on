# tf_azurerm_allspark_sql_always_on
Terraform module to configure an AllSpark SQL Always On Cluster.

## Input variables
  * allspark [required] - n.b. this is a map of data generated from tf_azurerm_allspark_vpc
  * server_name [required]
  * admin_username [required]
  * admin_password [required]
  * db_names [required] - list


## Outputs
  * allspark_data - map


## Example use

    module "allspark" {
      source  = "github.com/Quaternioneer/tf_azurerm_allspark_sql_always_on"
      allspark = "${module.allspark.allspark_data}"
      server_name = "allspark"
      admin_username = "adminusersql"
      admin_password = "reallySecurePassword909!"
      db_names = ["app1", "app2", "app3"]
    }


## License

MIT - see the included LICENSE file for more details.
