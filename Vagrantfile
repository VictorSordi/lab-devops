Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: "echo Config K3s cluster"
    config.vm.define "k3s" do |k3s|
        k3s.vm.box = "bento/ubuntu-22.04"
        k3s.vm.hostname = "k3s"
        k3s.vm.provision "shell", path: "./K3s/provision-k3s.sh"
        k3s.vm.network "private_network", ip: "192.168.56.2"
        k3s.vm.network "forwarded_port", guest: 80, host: 8090
    end

    config.vm.provision "shell", inline: "echo Config Jenkins"
    config.vm.define "Jenkins" do |jenkins|
        jenkins.vm.box = "bento/ubuntu-22.04"
        jenkins.vm.hostname = "Jenkins"
        jenkins.vm.provision "shell", path: "./Jenkins/provision-jenkins.sh"
        jenkins.vm.network "private_network", ip: "192.168.56.3"
        jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
        jenkins.vm.provider "virtualbox" do |vb|
            vb.name = "Jenkins"
            vb.memory = "2048"
            vb.cpus = "2"
        end   
    end

    config.vm.provision "shell", inline: "echo Config Sonar"
    config.vm.define "Sonarqube" do |sonarqube|
        sonarqube.vm.box = "bento/ubuntu-22.04"
        sonarqube.vm.hostname = "Sonarqube"
        sonarqube.vm.provision "shell", path: "./sonarqube/provision-sonarqube.sh"
        sonarqube.vm.network "private_network", ip: "192.168.56.4"
        sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000
        sonarqube.vm.provider "virtualbox" do |vb|
            vb.name = "Sonarqube"
            vb.memory = "2048"
            vb.cpus = "2"
        end
    end

    config.vm.provision "shell", inline: "echo Config Gitlab"
    config.vm.define "Gitlab" do |gitlab|
        gitlab.vm.box = "bento/ubuntu-22.04"
        gitlab.vm.hostname = "Gitlab"
        gitlab.vm.provision "shell", path: "./Gitlab/provision-gitlab.sh"
        gitlab.vm.network "private_network", ip: "192.168.56.5"
        gitlab.vm.network "forwarded_port", guest: 8070, host: 8070
        gitlab.vm.provider "virtualbox" do |vb|
            vb.name = "GitLab"
            vb.memory = "2048"
            vb.cpus = "2"
        end
    end

    config.vm.provision "shell", inline: "echo Config Monitoring"
    config.vm.define "Monitoring" do |monitoring|
        monitoring.vm.box = "bento/ubuntu-22.04"
        monitoring.vm.hostname = "Monitoring"
        monitoring.vm.provision "shell", path: "./Monitoring/provision-monitoring.sh"
        monitoring.vm.network "private_network", ip: "192.168.56.6"
    end

    config.vm.provision "shell", inline: "echo Config Nexus"
    config.vm.define "Nexus" do |nexus|
        nexus.vm.box = "bento/ubuntu-22.04"
        nexus.vm.hostname = "Nexus"
        nexus.vm.provision "shell", path: "./Monitoring/provision-Nexus.sh"
        nexus.vm.network "private_network", ip: "192.168.56.7"
    end
end