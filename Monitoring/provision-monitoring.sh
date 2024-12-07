#/bin/bash
echo ==== "Installing Docker and Docker Compose" =======================================
sudo apt update -y && sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

echo ==== "Starting Prometheus" =======================================
docker run -d -p 9090:9090 -v /vagrant/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus 

echo ==== "Starting Grafana" =======================================
docker run -d -p 3000:3000 --name grafana grafana/grafana:latest