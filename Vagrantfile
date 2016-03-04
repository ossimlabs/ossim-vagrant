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
  config.vm.synced_folder "formulas", "/srv/formulas", type: "nfs"
  config.vm.synced_folder "/data", "/data", type: "nfs"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
  end

  config.vm.define "ossimCore" do |ossimCore|
    ossimCore.vm.network "private_network", ip: "192.168.2.100"
    ossimCore.vm.hostname = "ossim-core.local"
    ossimCore.vm.provision :salt do |salt|
      salt.minion_id = "ossim-core.local"
      salt.masterless = true
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  config.vm.define "ossimGeocell" do |ossimGeocell|
    ossimGeocell.vm.network "private_network", ip: "192.168.2.101"
    ossimGeocell.vm.hostname = "ossim-core.local"
    ossimGeocell.ssh.forward_x11 = true
    ossimGeocell.vm.provision :salt do |salt|
      salt.minion_id = "ossim-geocell.local"
      salt.masterless = true
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  config.vm.define "omarApp" do |omarApp|
    omarApp.vm.network "private_network", ip: "192.168.2.102"
    omarApp.vm.hostname = "omar-app.local"
    omarApp.ssh.forward_x11 = true
    omarApp.vm.provision :salt do |salt|
      salt.minion_id = "omar-app.local"
      salt.masterless = true
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end



  #config.vm.provision "shell", path: "postup.sh"
end
