# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bhosmer/centos6.6-minimal"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.synced_folder "salt", "/srv/salt", type: "nfs"
  config.vm.synced_folder "pillar", "/srv/pillar", type: "nfs"
  #config.vm.synced_folder "/data", "/data", type: "nfs"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
  end

  config.vm.define "ossimCore" do |ossimCore|
    ossimCore.vm.network "private_network", ip: "192.168.33.100"
    ossimCore.vm.hostname = "ossim-core.local"

    ossimCore.vm.provision :salt do |salt|
      salt.minion_id = "ossim-core.local"
      salt.masterless = true
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  #config.vm.provision "shell", path: "postup.sh"
end
