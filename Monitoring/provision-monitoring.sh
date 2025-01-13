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

echo ==== "Starting Prometheus" =======================================
cat << EOF >> /home/vagrant/prometheus.yml
global:
  scrape_interval: 15s
  scrape_timeout: 10s
  evaluation_interval: 15s
scrape_configs:
  - job_name: prometheus_node
    static_configs:
      - targets: ['192.168.56.6:9100']
    metrics_path: /metrics
EOF
docker run -d -p 9090:9090 -v /home/vagrant/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

echo ==== "Starting Grafana" =======================================
docker run -d -p 3000:3000 --name grafana grafana/grafana:latest