variable "network_name" {
  description = "The network this database should join"
  type        = string
}

variable "mysql_root_password" {
  default = "somewordpress"
}