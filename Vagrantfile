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
    end

    config.vm.provision "shell", inline: "echo Config Sonar"
    config.vm.define "Sonarqube" do |Sonarqube|
        Sonarqube.vm.box = "bento/ubuntu-22.04"
        Sonarqube.vm.hostname = "Sonarqube"
        Sonarqube.vm.provision "shell", path: "./sonarQube/provision-sonarqube.sh"
        Sonarqube.vm.network "private_network", ip: "192.168.56.4"
    end

    config.vm.provision "shell", inline: "echo Config Gitlab"
    config.vm.define "Gitlab" do |Gitlab|
        Gitlab.vm.box = "bento/ubuntu-22.04"
        Gitlab.vm.hostname = "Gitlab"
        Gitlab.vm.provision "shell", path: "./Gitlab/provision-gitlab.sh"
        Gitlab.vm.network "private_network", ip: "192.168.56.5"
    end

    config.vm.provision "shell", inline: "echo Config Argo"
    config.vm.define "ArgoCD" do |ArgoCD|
        ArgoCD.vm.box = "bento/ubuntu-22.04"
        ArgoCD.vm.hostname = "ArgoCD"
        ArgoCD.vm.provision "shell", path: "./ArgoCD/argocd-provision.sh"
        ArgoCD.vm.network "private_network", ip: "192.168.56.6"
    end

    config.vm.provision "shell", inline: "echo Config Monitoring"
    config.vm.define "Monitoring" do |Monitoring|
        Monitoring.vm.box = "bento/ubuntu-22.04"
        Monitoring.vm.hostname = "Monitoring"
        Monitoring.vm.provision "shell", path: "./Monitoring/provision-monitoring.sh"
        Monitoring.vm.network "private_network", ip: "192.168.56.7"
    end
end