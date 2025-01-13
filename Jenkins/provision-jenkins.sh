#!/bin/bash
# Instalação Jenkins
echo ==== "Installing Jenkins" =======================================
sudo apt update && apt upgrade -y
sudo apt install unzip -y
sudo apt install openjdk-17-jdk -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
systemctl enable jenkins.service
systemctl start jenkins.service

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

# Instalation sonar scanner
echo ==== "Installing sonar scanner" =======================================
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-linux-x64.zip
unzip sonar-scanner-cli-6.2.1.4610-linux-x64.zip -d /opt/
mv /opt/sonar-scanner-6.2.1.4610-linux-x64 /opt/sonar-scanner/
chown -R jenkins:jenkins /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs -y


echo ==== "Installing Maven" =======================================
sudo apt update
sudo apt install maven -y


echo ==== "Installing Node" =======================================
sudo apt update
sudo apt install npm -y

echo ==== "Installing Node" =======================================
sudo apt update
sudo apt install golang -y