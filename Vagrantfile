# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "host.stan.com"
  config.vm.synced_folder "shared", "/vagrant_shared"

  #NGINX server
  config.vm.define "web" do |web|
     web_sources = 'd:/sources/javascript/chartroom-ui'
	 web.vm.box = "ubuntu/trusty64"
     web.vm.network "forwarded_port", guest: 80, host: 80
     web.vm.network "private_network", ip: "192.168.33.10"
     web.vm.synced_folder "shared", "/vagrant_shared"
     web.vm.synced_folder web_sources, "/var/www"
    
     web.vm.provider "virtualbox" do |vb|
	   vb.name = "web"
       vb.memory = "256"
     end
 

	  web.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update -y
	  SHELL
	  web.vm.provision "shell", path: "provision/nginx/nginx_install.sh"
	  web.vm.provision "shell", path: "provision/nginx/nginx_start.sh", run: "always", privileged: false
  end

  #NODE.JS server
  config.vm.define "node" do |node|
     node_sources = 'd:/sources/nodejs/test-1/'
	 node.vm.box = "ubuntu/trusty64"
     node.vm.network "forwarded_port", guest: 3001, host: 3001
     node.vm.network "private_network", ip: "192.168.33.11"
     node.vm.synced_folder node_sources, "/var/node"
     node.vm.hostname = "nodejs"
 
     node.vm.provider "virtualbox" do |vb|
	   vb.name = "nodejs"
       vb.memory = "256"
     end
 

	  node.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update -y
	  SHELL
	  node.vm.provision "shell", path: "provision/nodejs/nodejs_install.sh"
	  node.vm.provision "shell", path: "provision/nodejs/nodejs_start.sh", run: "always", privileged: false
  end
end
