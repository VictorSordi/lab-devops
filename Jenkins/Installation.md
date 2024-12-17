Pegar senha inicial
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Instalar Gitlab 
sudo docker run -d --hostname 192.168.56.3 -p 8070:80 -p 443:443 -p 2022:22 --name gitlab --restart always -v /home/vagrant/gitlab/config:/etc/gitlab -v /home/vagrant/gitlab/logs:/var/log/gitlab -v /home/vagrant/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:17.1.2-ce.0

Instalar Nexus
docker run -d -p 8091:8081 -p 8123:8123 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

Instalar Prometheus e Grafana
docker run -d -p 9090:9090 -v /home/vagrant/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
docker run -d -p 3000:3000 --name grafana grafana/grafana:latest