<h1 align="center">
  <br>
  Capstone Project
  <br>
</h1>

<h4 align="center">A minimal Microservices based calculator application based over <a href="https://github.com/khandelwal-arpit/kubernetes-starterkit" target="_blank">Kubernetes Starterkit Project</a>.</h4>

<h4 align="center">Team 26:
  <br>
  90718, Gonçalo Velhinho
  <br>
  90792, Diogo Dias
  <br>
  96742, Inês Gomes
  <br>
</h4>

<h4 align="center"><a href="https://github.com/Velhinho/kubernetes-starterkit" target="_blank">Team 26 Working Repository</a></h4>


## Micro-services ##

* *Vuecalc* service
* *Happy* service
* *Expressed* service
* *Bootstorage* service

### Vuecalc ###
A vue-cli 3.0 based Vue.js application which renders the calculator UI.
The service is composed of 'home', 'calculator' and 'history' views. It uses Axios library to do all the API calls. The 'history' view shows a list of recent operations done over the calculator application by fetching them from the 'Bootstorage' service.

### Expressed ###
It is an Express.js based web application serving basic APIs for addition and subtraction. 
The _Vuecalc_ service calls the apis from this service when it has to do an add or subtract operation, once the operation is complete the _Bootstorage_ service stores the last performed operation in the database.

### Happy ###
It is a Hapi.js (v17.8.x) based application having two basic APIs for multiplication and division.
It also uses the _Bootstorage_ service to store the last executed operation.

### Bootstorage ###
The _Bootstorage_ is a simple Flask application that uses SQLite to store the operations made by _Happy_ and _Expressed_ services and to display past operations to _Vuecalc_ service.

## Infrastructure ##

The infrastructure consists of a Google Cloud Compute Engine for each micro-service.
* *Vue*
* *Happy*
* *Expressed*
* *Bootstorage*

### Deployment ###
The infrastructure is deployed by Terraform and managed by Ansible. For deployment refer to [README.md](https://github.com/Velhinho/kubernetes-starterkit/blob/master/infrastructure/README.md) at the infrastructure folder.

## Environment ##

In order to deploy these infrastructure, it is assumed the following environment using Vagrant and VirtualBox.

On a Project directory (containing this kubernetes-starterkit project):
```
vagrant init
vagrant plugin install vagrant-vbguest
```

In this directory having a Vagrantfile such as
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure this Project is for Virtualbox Provider
ENV['VAGRANT_DEFAULT_PROVIDER'] = "virtualbox"

# Ensure the required plugins are globally installed
VAGRANT_PLUGINS = [
  "vagrant-vbguest",
  "vagrant-reload",
]
  VAGRANT_PLUGINS.each do |plugin|
    unless Vagrant.has_plugin?("#{plugin}")
      system("vagrant plugin install #{plugin}")
      exit system('vagrant', *ARGV)
    end
  end

# Start the process  
Vagrant.configure("2") do |config|

  config.ssh.insert_key = false
  config.vbguest.auto_update = false
  config.vm.box_check_update = false

  # create Management (mgmt) node
  config.vm.define "mgmt" do |mgvb|
    mgvb.vm.box = "ubuntu/focal64"
    mgvb.vm.hostname = "mgmt"
    mgvb.vm.network :private_network, ip: "192.168.56.10"
    # Provider Virtualbox
    mgvb.vm.provider "virtualbox" do |vb|
      vb.name = "mgmt"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.memory = "1024"
      vb.cpus = 1
    end # of vb
    # Shared folders
    if Vagrant::Util::Platform.windows? then
      # Configuration SPECIFIC for Windows 10 hosts
      mgvb.vm.synced_folder "kubernetes-starterkit", "/home/vagrant/kubernetes-starterkit",
        owner: "vagrant", group: "vagrant",
        mount_options: ["dmode=775","fmode=755"]
    else
      mgvb.vm.synced_folder "kubernetes-starterkit", "/home/vagrant/kubernetes-starterkit",
        mount_options: ["dmode=775","fmode=755"]
    end # of shared folders
    # Provisioning with reload (reboot)
    mgvb.vm.provision :shell, path: "bootstrap-mgmt.sh"
    mgvb.vm.provision :reload
  end # of mgvb
end # of config
```

By running the command ```vagrant up``` the mgmt machine will be started and by using ```vagrant ssh``` it is possible to connect to the machine's console. There we can easily deploy our infrastructure as explain at [README.md](https://github.com/Velhinho/kubernetes-starterkit/blob/master/infrastructure/README.md).

## Create and share the Group the RSA SSH keypair ##

To have access via SSH to the VM instances that will be created it is needed to have a SSH keypair.
1. To generate the Group SSH Keypair, go to the home directory of the
Management node (mgmt) and run the command ```ssh-keygen -t rsa -b 4096```, where '-t' corresponds to the type of key (RSA) and '-b' its length. Hit ENTER to the prompts and do not provide a password.
2. Copy the public and private keys from the .ssh folder to the project folder:
3. Insert into the authorized_keys file the generated PUBLIC key verifying that you have a second entry:
```
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
cat .ssh/authorized_keys
```

By running the command ```exit``` to exit the machine console and then ```vagrant halt``` the mgmt machine will be stoped. Check the machines status with ```vagrant global-status```.

-----