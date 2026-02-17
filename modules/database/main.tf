resource "terraform_data" "db" {
  provisioner "local-exec" {
    # Windows Command to run MySQL
    command = "docker run -d --name mysql_db --network ${var.network_name} -e MYSQL_ROOT_PASSWORD=${var.mysql_root_password} -e MYSQL_DATABASE=wordpress mysql:5.7"
    
    # 🔒 FORCE VERSION 1.44 HERE
    environment = {
      DOCKER_API_VERSION = "1.44"
    }
  }

  provisioner "local-exec" {
    when    = destroy
    command = "docker rm -f mysql_db"
    environment = {
      DOCKER_API_VERSION = "1.44"
    }
  }
}

output "db_host" {
  value = "mysql_db"
}