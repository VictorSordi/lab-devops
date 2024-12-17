Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: "echo Config K3s cluster"
    config.vm.define "k3s" do |k3s|
        k3s.vm.box = "bento/ubuntu-22.04"
        k3s.vm.hostname = "K3s"
        k3s.vm.provision "shell", path: "./K3s/provision-k3s.sh"
        k3s.vm.network "private_network", ip: "192.168.56.2"
        k3s.vm.network "forwarded_port", guest: 80, host: 8090
        k3s.vm.provider "virtualbox" do |vb|
            vb.name = "K3s"
            vb.memory = "2048"
            vb.cpus = "2"
        end
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
            vb.memory = "4096"
            vb.cpus = "2"
        end   
    end

    config.vm.provision "shell", inline: "echo Config Sonar"
    config.vm.define "Sonarqube" do |sonarqube|
        sonarqube.vm.box = "bento/ubuntu-22.04"
        sonarqube.vm.hostname = "Sonarqube"
        sonarqube.vm.provision "shell", path: "./Sonarqube/provision-sonarqube.sh"
        sonarqube.vm.network "private_network", ip: "192.168.56.4"
        sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000
        sonarqube.vm.provider "virtualbox" do |vb|
            vb.name = "Sonarqube"
            vb.memory = "4096"
            vb.cpus = "2"
        end
    end
end