#/usr/bin/bash
echo ==== "Installing SonarQube" =======================================
useradd sonar
apt update && apt upgrade -y
apt install wget unzip openjdk-17-jdk -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-24.12.0.100206.zip
unzip sonarqube-24.12.0.100206.zip -d /opt/
mv /opt/sonarqube-24.12.0.100206 /opt/sonarqube/
chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat << EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
systemctl daemon-reload
service sonar start

# Instalation sonar scanner
echo ==== "Installing sonar scanner" =======================================
apt install unzip -y
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-linux-x64.zip
unzip sonar-scanner-cli-6.2.1.4610-linux-x64.zip -d /opt/
mv /opt/sonar-scanner-6.2.1.4610-linux-x64 /opt/sonar-scanner/
chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs -y