# -*- mode: ruby -*-
# vi: set ft=ruby :

HOST_FORWARDED_PORT = 8080
CPUS = 2
RAM = 4096

Vagrant.configure("2") do |config|
  config.vagrant.plugins = "vagrant-vbguest"

  config.vm.define "node" do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "node"

    config.vm.network "private_network", ip: "192.168.50.10"
    config.vm.network "forwarded_port", guest: 80, host: HOST_FORWARDED_PORT

    if Vagrant.has_plugin?("vagrant-vbguest")
      node.vbguest.no_install = true
    end

    node.vm.provider "virtualbox" do |vb|
      vb.name = "node"
      vb.cpus = CPUS
      vb.memory = RAM
    end

    config.vm.provision "docker"

    config.vm.provision "ansible_local" do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "ansible/main.yml"
      ansible.limit = "all"
    end

    config.vm.provision "shell", privileged: false, inline: <<-SCRIPT
k3d cluster create --api-port 6443 -p "80:80@loadbalancer" --servers 1 --agents 1 --kubeconfig-update-default --kubeconfig-switch-context
helm repo add bitnami https://charts.bitnami.com/bitnami
cd /vagrant/terraform
terraform init
terraform apply -auto-approve
    SCRIPT
  end
end