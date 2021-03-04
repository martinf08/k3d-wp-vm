# k3d-wp-vm

<p>Setup local wordpress with automated deployment on k3s cluster and virtual machine</p>

Tools used :
- Vagrant
- K3d
- Docker 
- Ansible
- Terraform
- Helm

## Prerequisite
- Vagrant : https://www.vagrantup.com/
- <code>vagrant plugin install vagrant-vbguest</code>

## Deployment
- <code>vagrant up</code>
- http://localhost:8080
<p>The host forwarded port and resources can be changed in the Vagranfile</p>

## Control panel
- http://localhost:8080/wp-login.php
- username : admin
- password : admin