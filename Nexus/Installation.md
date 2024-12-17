Comando docker para deploy do nexus
docker run -d -p 8091:8081 -p 8123:8123 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

Pegar a senha inicial
cat /nexus-data/admin.password