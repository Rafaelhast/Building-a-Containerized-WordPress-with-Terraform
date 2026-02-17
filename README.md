# Terraform Docker WordPress Infrastructure

This project automates the deployment of a containerized WordPress site using **Terraform** and **Docker Desktop** on Windows.

## 🏗️ Architecture
The infrastructure is organized into modular components to ensure scalability and isolation:
* **Network Module**: Provisions a bridge network for secure inter-container communication.
* **Database Module**: Deploys a MySQL 5.7 container with persistent environment variables.
* **App Module**: Deploys the WordPress application, exposing it on port 8080.



## 🛠️ Key Troubleshooting: The "Exec Format Error"
During development, a significant hurdle was encountered regarding the `exec format error`. This was resolved by:
1. **Resetting WSL 2**: Forcing a shutdown of the Linux subsystem to clear cached binary errors.
2. **Docker Storage Tuning**: Disabling the "containerd" image store in Docker Desktop to ensure architecture parity for `linux/amd64`.
3. **Cache Purge**: Manually removing corrupted image layers before re-running the Terraform plan.

## 🚀 Deployment Instructions
1. Ensure Docker Desktop is running in **Linux Container mode**.
2. Initialize the project:
   ```powershell
   terraform init