# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
#  config.vm.box = "bhosmer/centos6.6-minimal"

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
  #config.vm.synced_folder "/Volumes/DataDrive/data", "/data", type: "nfs"
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
#     vb.customize ["modifyvm", :id, "--name", "MYBOX"]
  end

  config.vm.define "postgres" do |postgres|
    postgres.vm.box = "bento/centos-6.7"
    postgres.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-postgres"
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

  config.vm.define "httpd" do |httpd|
    httpd.vm.box = "bento/centos-6.7"
    httpd.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-httpd"
    end
    httpd.vm.network "private_network", ip: "192.168.2.200"
    httpd.vm.hostname = "httpd.local"
    httpd.ssh.forward_x11 = false
    httpd.vm.provision :salt do |salt|
      salt.minion_id = "httpd.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "wmtsApp" do |wmtsApp|
    wmtsApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-wmtsApp"
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
    stagerApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-stagerApp"
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
    wmsApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-wmsApp"
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
    wfsApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-wfsApp"
    end
    wfsApp.vm.network "private_network", ip: "192.168.2.104"
    wfsApp.vm.hostname = "wfs-app.local"
    wfsApp.ssh.forward_x11 = false
    wfsApp.vm.provision :salt do |salt|
      salt.minion_id = "wfs-app.local"
      salt.masterless = true
      salt.run_highstate = true
#      salt.log_level = "info"
#      salt.verbose = true
    end
  end

  config.vm.define "superoverlayApp" do |superoverlayApp|
    superoverlayApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-superoverlayApp"
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

  config.vm.define "swipeApp" do |swipeApp|
   swipeApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-swipeApp"
    end
    swipeApp.vm.network "private_network", ip: "192.168.2.106"
    swipeApp.vm.hostname = "swipe-app.local"
    swipeApp.ssh.forward_x11 = false
    swipeApp.vm.provision :salt do |salt|
      salt.minion_id = "swipe-app.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "jpipApp" do |jpipApp|
   jpipApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-jpipApp"
    end
    jpipApp.vm.network "private_network", ip: "192.168.2.107"
    jpipApp.vm.hostname = "jpip-app.local"
    jpipApp.ssh.forward_x11 = false
    jpipApp.vm.provision :salt do |salt|
      salt.minion_id = "jpip-app.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

  config.vm.define "jpipServer" do |jpipServer|
   jpipServer.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-jpipServer"
    end
    jpipServer.vm.network "private_network", ip: "192.168.2.108"
    jpipServer.vm.hostname = "jpip-server.local"
    jpipServer.ssh.forward_x11 = false
    jpipServer.vm.provision :salt do |salt|
      salt.minion_id = "jpip-server.local"
      salt.masterless = true
      salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
    end
  end

 config.vm.define "sqsApp" do |sqsApp|
    sqsApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-sqsApp"
    end
   sqsApp.vm.network "private_network", ip: "192.168.2.109"
   sqsApp.vm.hostname = "sqs-app.local"
   sqsApp.ssh.forward_x11 = false
   sqsApp.vm.provision :salt do |salt|
     salt.minion_id = "sqs-app.local"
     salt.masterless = true
     salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
   end
 end

 config.vm.define "avroApp" do |avroApp|
    avroApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-avroApp"
    end
   avroApp.vm.network "private_network", ip: "192.168.2.110"
   avroApp.vm.hostname = "avro-app.local"
   avroApp.ssh.forward_x11 = false
   avroApp.vm.provision :salt do |salt|
     salt.minion_id = "avro-app.local"
     salt.masterless = true
     salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
   end
 end

 config.vm.define "wcsApp" do |wcsApp|
    wcsApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-wcsApp"
    end
   wcsApp.vm.network "private_network", ip: "192.168.2.111"
   wcsApp.vm.hostname = "wcs-app.local"
   wcsApp.ssh.forward_x11 = false
   wcsApp.vm.provision :salt do |salt|
     salt.minion_id = "wcs-app.local"
     salt.masterless = true
     salt.run_highstate = true
#     salt.log_level = "all"
#     salt.verbose = true
   end
 end

 config.vm.define "downloadApp" do |downloadApp|
    downloadApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-downloadApp"
    end
   downloadApp.vm.network "private_network", ip: "192.168.2.112"
   downloadApp.vm.hostname = "download-app.local"
   downloadApp.ssh.forward_x11 = false
   downloadApp.vm.provision :salt do |salt|
     salt.minion_id = "download-app.local"
     salt.masterless = true
     salt.run_highstate = true
 #     salt.log_level = "all"
 #     salt.verbose = true
   end
 end


 config.vm.define "omarApp" do |omarApp|
    omarApp.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.name = "vagrant-omarApp"
    end
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

 config.vm.define "devBuild" do |devBuild|
    devBuild.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
        # Set the number of virtual CPUs for the virtual machine
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
        # Enabling the I/O APIC is required for 64-bit guest operating systems, especially Windows Vista;
        # it is also required if you want to use more than one virtual CPU in a VM.
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
        # Enable the use of hardware virtualization extensions (Intel VT-x or AMD-V) in the processor of your host system
      vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
        # Enable, if Guest Additions are installed, whether hardware 3D acceleration should be available
      vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
      vb.name = "vagrant-devBuild"
    end
   devBuild.vm.box = "centos/7"
   devBuild.vm.network "private_network", ip: "192.168.2.141"
   devBuild.vm.hostname = "dev-build.local"
   devBuild.ssh.forward_x11 = true
   devBuild.vm.provision :salt do |salt|
     salt.minion_id = "dev-build.local"
     salt.masterless = true
     salt.run_highstate = true
     salt.log_level = "all"
   end
 end

  config.vm.define "jenkins", autostart: false do |jenkins|
    jenkins.vm.box = "centos/7"
    jenkins.vm.network "private_network", ip: "192.168.2.150"
    jenkins.vm.hostname = "jenkins.local"
    jenkins.ssh.forward_x11 = true
    jenkins.vm.provision :salt do |salt|
      salt.minion_id = "jenkins.local"
      salt.minion_config = "minion-config/minion"
      salt.masterless = true
      salt.run_highstate = true
      salt.log_level = "all"
    end
    jenkins.vm.provision "shell", inline: "if [ -f /var/lib/jenkins/secrets/initialAdminPassword ] ; then echo Jenkins Initial Admin Password: `cat /var/lib/jenkins/secrets/initialAdminPassword`; fi; echo URL: http://192.168.2.150:8080/"
  end


config.vm.define "test" do |test|
  test.vm.box = "centos/7"
  test.vm.network "private_network", ip: "192.168.2.140"
  test.vm.hostname = "test.local"
  test.ssh.forward_x11 = true
  test.vm.provision :salt do |salt|
    salt.minion_id = "test.local"
    salt.masterless = true
    salt.run_highstate = true
    salt.log_level = "all"
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
