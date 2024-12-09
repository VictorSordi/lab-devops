#! /bin/bash
echo ==== "Installing K3s cluster" =======================================
curl -sfL https://get.k3s.io | sh 
apt install net-tools unzip git -y
git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
echo << EOF >> /etc/rancher/k3s/registries.yaml
mirrors:
  docker.io:
    endpoint:
      - "http://192.168.56.7:8123"
configs:
  "192.168.56.7:8123":
    auth:
      username: jenkins
      password: J3nk1ns@
EOF
