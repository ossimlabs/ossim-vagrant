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
  #config.vm.synced_folder "/data", "/data", type: "nfs"
  config.vm.synced_folder "/Volumes/DataDrive/data", "/data", type: "nfs"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
  end

  config.vm.define "postgres" do |postgres|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    postgres.vm.network "private_network", ip: "192.168.2.100"
    postgres.vm.hostname = "postgres.local"
    postgres.ssh.forward_x11 = false
    postgres.vm.provision :salt do |salt|
      salt.minion_id = "postgres.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "wmtsApp" do |wmtsApp|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    wmtsApp.vm.network "private_network", ip: "192.168.2.101"
    wmtsApp.vm.hostname = "wmts-app.local"
    wmtsApp.ssh.forward_x11 = false
    wmtsApp.vm.provision :salt do |salt|
      salt.minion_id = "wmts-app.local"
      salt.masterless = true
      salt.run_highstate = true
#      salt.log_level = "all"
#      salt.verbose = true
    end
  end

  config.vm.define "stagerApp" do |stagerApp|
    config.vm.provider "virtualbox" do |vb|
       vb.memory = "1024"
    end
    stagerApp.vm.network "private_network", ip: "192.168.2.102"
    stagerApp.vm.hostname = "stager-app.local"
    stagerApp.ssh.forward_x11 = false
    stagerApp.vm.provision :salt do |salt|
      salt.minion_id = "stager-app.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "wmsApp" do |wmsApp|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    wmsApp.vm.network "private_network", ip: "192.168.2.103"
    wmsApp.vm.hostname = "wms-app.local"
    wmsApp.ssh.forward_x11 = false
    wmsApp.vm.provision :salt do |salt|
      salt.minion_id = "wms-app.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "wfsApp" do |wfsApp|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    wfsApp.vm.network "private_network", ip: "192.168.2.104"
    wfsApp.vm.hostname = "wfs-app.local"
    wfsApp.ssh.forward_x11 = false
    wfsApp.vm.provision :salt do |salt|
      salt.minion_id = "wfs-app.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "superoverlayApp" do |superoverlayApp|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    superoverlayApp.vm.network "private_network", ip: "192.168.2.105"
    superoverlayApp.vm.hostname = "superoverlay-app.local"
    superoverlayApp.ssh.forward_x11 = false
    superoverlayApp.vm.provision :salt do |salt|
      salt.minion_id = "superoverlay-app.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

 config.vm.define "omarApp" do |omarApp|
   omarApp.vm.network "private_network", ip: "192.168.2.120"
   omarApp.vm.hostname = "omar-app.local"
   omarApp.ssh.forward_x11 = false
   omarApp.vm.provision :salt do |salt|
     salt.minion_id = "omar-app.local"
     salt.masterless = true
     salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
   end
 end

#  config.vm.define "workflow" do |workflow|
#    workflow.vm.network "private_network", ip: "192.168.2.130"
#    workflow.vm.hostname = "workflow.local"
#    workflow.ssh.forward_x11 = true
#    workflow.vm.provision :salt do |salt|
#      salt.minion_id = "workflow.local"
#      salt.masterless = true
#      salt.run_highstate = true
#      salt.log_level = "all"
#    end
#  end
  
  #config.vm.provision "shell", path: "postup.sh"
end
