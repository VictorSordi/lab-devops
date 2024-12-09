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

echo ==== "Installing Gitlab" =======================================
sudo mkdir -p /home/vagrant/gitlab/config /home/vagrant/gitlab/logs /home/vagrant/gitlab/data 
sudo docker run -d --hostname 192.168.56.5 -p 8070:80 -p 443:443 -p 2022:22 --name gitlab --restart always -v /home/vagrant/gitlab/config:/etc/gitlab -v /home/vagrant/gitlab/logs:/var/log/gitlab -v /home/vagrant/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:17.1.2-ce.0