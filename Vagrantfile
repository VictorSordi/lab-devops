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
    config.vm.define "Jenkins" do |Jenkins|
        Jenkins.vm.box = "bento/ubuntu-22.04"
        Jenkins.vm.hostname = "Jenkins"
        Jenkins.vm.provision "shell", path: "./Jenkins/provision-jenkins.sh"
        Jenkins.vm.network "private_network", ip: "192.168.56.3"
        Jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
        Jenkins.vm.provider "virtualbox" do |vb|
            vb.name = "Jenkins"
            vb.memory = "2048"
            vb.cpus = "2"
        end   
    end

    config.vm.provision "shell", inline: "echo Config Sonar"
    config.vm.define "Sonarqube" do |Sonarqube|
        Sonarqube.vm.box = "bento/ubuntu-22.04"
        Sonarqube.vm.hostname = "Sonarqube"
        Sonarqube.vm.provision "shell", path: "./sonarQube/provision-sonarqube.sh"
        Sonarqube.vm.network "private_network", ip: "192.168.56.4"
        Sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000
        Sonarqube.vm.provider "virtualbox" do |vb|
            vb.name = "Sonarqube"
            vb.memory = "2048"
            vb.cpus = "2"
        end
    end

    config.vm.provision "shell", inline: "echo Config Gitlab"
    config.vm.define "Gitlab" do |Gitlab|
        Gitlab.vm.box = "bento/ubuntu-22.04"
        Gitlab.vm.hostname = "Gitlab"
        Gitlab.vm.provision "shell", path: "./Gitlab/provision-gitlab.sh"
        Gitlab.vm.network "private_network", ip: "192.168.56.5"
        Gitlab.vm.network "forwarded_port", guest: 8070, host: 8070
        Gitlab.vm.provider "virtualbox" do |vb|
            vb.name = "GitLab"
            vb.memory = "2048"
            vb.cpus = "2"
        end
    end

    config.vm.provision "shell", inline: "echo Config Monitoring"
    config.vm.define "Monitoring" do |Monitoring|
        Monitoring.vm.box = "bento/ubuntu-22.04"
        Monitoring.vm.hostname = "Monitoring"
        Monitoring.vm.provision "shell", path: "./Monitoring/provision-monitoring.sh"
        Monitoring.vm.network "private_network", ip: "192.168.56.6"
    end

    config.vm.provision "shell", inline: "echo Config Nexus"
    config.vm.define "Nexus" do |Nexus|
        Nexus.vm.box = "bento/ubuntu-22.04"
        Nexus.vm.hostname = "Nexus"
        Nexus.vm.provision "shell", path: "./Monitoring/provision-Nexus.sh"
        Nexus.vm.network "private_network", ip: "192.168.56.7"
    end
end