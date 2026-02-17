terraform {
  # We don't need required_providers anymore!
  # We are running raw commands now.
}

# 🔗 1. The Network
module "network" {
  source = "./modules/network"
}

# 🔗 2. The Database
module "database" {
  source       = "./modules/database"
  network_name = module.network.network_name
  mysql_root_password = "somewordpress"
  # 🛑 WAIT FOR NETWORK!
  depends_on = [ module.network ]
}

# 🔗 3. The WordPress App
module "wordpress" {
  source = "./modules/app"
  network_name   = module.network.network_name
  db_host        = module.database.db_host
  wordpress_port = 8080
}
