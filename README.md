#OSSIMLABS Vagrant Binary Distribution

**dependencies**:

* Install [Vagrant](https://www.vagrantup.com/downloads.html) for your OS
* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS 
* Network Connection
* git client

#Introduction

ossim-vagrant module under ossimlabs allows one to install and configure an entire local cluster for trying and testing the binary distribution of OSSIM and the new OMAR version 2 or O2 distribution.

```git
git clone https://github.com/ossimlabs/ossim-vagrant.git
cd ossim-vagrant
git checkout dev  # checkout dev if desired to use latest and greatest
```
Now edit the vagrant file and make sure that you set a NFS share directory where your data resides.  Change the line **"/Volumes/DataDrive/data"** found in:

  config.vm.synced_folder "/Volumes/DataDrive/data", "/data", type: "nfs"

to a local directory that exists with data.

Now issue a *vagrant up*.


The **vagrant up** command will bring up the following VMs **httpd**, **postgres**, **WMTS**, **Stager**, **WMS**, **WFS**, **SuperOverlay**, **Swipe**, **OMAR Web UI** for a total of 9 VMs.

To bring up the main UI can browse to the following link: http://192.168.2.200/omar-app/omar


Other useful links:

* http://192.168.2.200/wms-app/
* http://192.168.2.200/wfs-app/
* http://192.168.2.200/stager-app/
* http://192.168.2.200/superoverlay-app/

# Notes

This section is reserved for notes that are usuful for the vagrant environment.

##NFS Share and password prompting

If you do not want to be prompted for a password when doing NFS share mount modifications in Vagrant you can add the following to your sudoers:

```bash
%admin  ALL=(ALL) NOPASSWD: ALL
```

Other groups can be used for other flavors of linux.  For some you can use the %wheel group