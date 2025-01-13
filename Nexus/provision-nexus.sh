# Installation docker and docker compose
echo ==== "Installing Docker and Docker Compose" =======================================
sudo apt update -y
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
groupadd docker
usermod -aG docker vagrant
newgrp docker
systemctl daemon-reload
systemctl restart docker
newgrp docker
usermod -aG docker jenkins

# Running Nexus container on docker
echo ==== "Starting Nexus Repository" =======================================
docker run -d -p 8081:8081 -p 8123:8123 --name nexus -v nexus-data:/nexus-data sonatype/nexus3