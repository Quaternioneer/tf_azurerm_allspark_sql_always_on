variable "allspark" {
  description = "allspark network and storage details"
  type = "map"
}

variable "server_name" {
  description = "Name of the SQL server instance"
}

variable "admin_username" {
  description = "Server Admin User"
}

variable "admin_password" {
  description = "Server Admin Password"
}

variable "db_names" {
  description = "Server Admin Password"
  type = "list"
}
