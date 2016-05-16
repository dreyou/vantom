# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Local configuration variables

# $total - count of Tomcats servers to up and run
$total = 3

#Vagrant configuration
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end
  config.vm.box = "bento/centos-6.7"
#  config.vm.box = "centos/atomic-host"
# Creating balncer server
  config.vm.define :b0 do |b0|
    b0.vm.hostname = "b0"
    b0.vm.network "forwarded_port", guest: 80, host: "9080"
    b0.vm.network "forwarded_port", guest: 443, host: "9443"
    b0.vm.network "private_network", ip: "192.168.33.10"
  end
# Creating tomcat servers
  (1..$total).each do |i|
    config.vm.define "s#{i}" do |server|
      server.vm.hostname = "s#{i}"
      server.vm.network "forwarded_port", guest: 8080, host: "808#{i}"
      server.vm.network "forwarded_port", guest: 9050, host: "905#{i}"
      server.vm.network "private_network", ip: "192.168.33.1#{i}"
    end
  end
end
