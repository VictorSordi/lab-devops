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

echo ==== "Installing Gitlab" =======================================
sudo mkdir -p /home/vagrant/gitlab/config /home/vagrant/gitlab/logs /home/vagrant/gitlab/data 
sudo docker run -d --hostname 192.168.56.5 -p 8070:80 -p 443:443 -p 2022:22 --name gitlab --restart always -v /home/vagrant/gitlab/config:/etc/gitlab -v /home/vagrant/gitlab/logs:/var/log/gitlab -v /home/vagrant/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:17.1.2-ce.0