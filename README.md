#OSSIMLABS Vagrant Binary Distribution

**dependencies**:

* Install [Vagrant](https://www.vagrantup.com/downloads.html) for your OS
* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS 
* Network Connection
* git client

#Introduction

ossim-vagrant module under ossimlabs allows one to install and configure an entire local cluster for trying and testing the binary distribution of OSSIM and the new OMAR version 2 also known as the O2 distribution.

```git
git clone https://github.com/ossimlabs/ossim-vagrant.git
cd ossim-vagrant
git checkout dev  # checkout dev if desired to use latest and greatest
```
Now edit the vagrant file and make sure that you set a NFS share directory where your data resides.  Change the line **"/Volumes/DataDrive/data"** found in:

  config.vm.synced_folder "/Volumes/DataDrive/data", "/data", type: "nfs"

to a local directory that exists with data.  That directory will be mounted on all VMs as /data

Now issue a *vagrant up*.


The **vagrant up** command will bring up the following VMs **httpd**, **postgres**, **WMTS**, **Stager**, **WMS**, **WFS**, **SuperOverlay**, **Swipe**, **OMAR Web UI** for a total of 9 VMs.

Once the VMs are up and running you can browse to the main Web UI by following  [http://192.168.2.200/omar-app/omar](http://192.168.2.200/omar-app/omar)


All services are running on their own VM and are reachable directly.  The direct IPs are listed in the vagrant file and are not listed here.  The httpd VM is a proxy to the web services and are reached by the following base URL.

* http://192.168.2.200/wms-app/
* http://192.168.2.200/wfs-app/
* http://192.168.2.200/stager-app/
* http://192.168.2.200/superoverlay-app/

Some of the URLs have *Swagger* API documentation and can be reached by adding the api path to the URL.  Example: [http://192.168.2.200/stager-app/api](http://192.168.2.200/stager-app/api)

# Notes

This section is reserved for notes that are usuful for the vagrant environment.

##NFS Share and password prompting

If you do not want to be prompted for a password when doing NFS share mount modifications in Vagrant you can add the following to your sudoers:

```bash
%admin  ALL=(ALL) NOPASSWD: ALL
```

Other groups can be used for other flavors of linux.  For some you can use the %wheel group