variable "network_name" {
  description = "Network to join"
  type        = string
}

variable "db_host" {
  description = "Address of the database"
  type        = string
}

variable "wordpress_port" {
  description = "Port to expose on host"
  type        = number
  default     = 8080
}