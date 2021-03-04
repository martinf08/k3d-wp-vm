# k3d-wp-vm

<p>Setup wordpress automated deployment on k3s cluster and virtual machine</p>

Tools used :
- Vagrant
- K3d
- Docker 
- Ansible
- Terraform
- Helm

## Prerequisite
- <code>vagrant plugin install vagrant-vbguest</code>

## Deployment
- <code>vagrant up<code>
- http://localhost:8080
<p>The host forwarded port and resources can be changed in the Vagranfile</p>

## Control panel
- <code>http://localhost:8080/wp-login.php</code>
- username : admin
- password : admin