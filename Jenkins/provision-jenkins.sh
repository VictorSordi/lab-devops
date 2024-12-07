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