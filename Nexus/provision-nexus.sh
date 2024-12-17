# Installation docker and docker compose
echo ==== "Installing docker and docker compose" =======================================
apt update -y && sudo apt upgrade -y
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update -y
apt install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
groupadd docker
usermod -aG docker vagrant
newgrp docker
systemctl daemon-reload
systemctl restart docker
newgrp docker

# Running Nexus container on docker
echo ==== "Starting Nexus Repository" =======================================
docker run -d -p 8091:8081 -p 8123:8123 --name nexus -v nexus-data:/nexus-data sonatype/nexus3