resource "terraform_data" "network" {
  provisioner "local-exec" {
    command = "docker network create wordpress_network || exit 0"
    
    # 🔒 FORCE VERSION 1.44 HERE
    environment = {
      DOCKER_API_VERSION = "1.44"
    }
  }

  provisioner "local-exec" {
    when    = destroy
    command = "docker network rm wordpress_network"
    environment = {
      DOCKER_API_VERSION = "1.44"
    }
  }
}

output "network_name" {
  value = "wordpress_network"
}