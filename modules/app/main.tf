resource "terraform_data" "wordpress" {
  provisioner "local-exec" {
    # Windows Command to run WordPress
    command = "docker run -d --name wordpress_app --network ${var.network_name} -p ${var.wordpress_port}:80 -e WORDPRESS_DB_HOST=${var.db_host} -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=somewordpress -e WORDPRESS_DB_NAME=wordpress wordpress:latest"

    # 🔒 FORCE VERSION 1.44 HERE
    environment = {
      DOCKER_API_VERSION = "1.44"
    }
  }

  provisioner "local-exec" {
    when    = destroy
    command = "docker rm -f wordpress_app"
    environment = {
      DOCKER_API_VERSION = "1.44"
    }
  }
}