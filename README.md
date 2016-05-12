#OSSIMLABS Vagrant Binary Distribution

**dependencies**:

* Install [Vagrant](https://www.vagrantup.com/downloads.html) for your OS
* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS 
* Network Connection
* git client
* CPU/BIOS supporting 64 bit virtualization



#Introduction

ossim-vagrant module under ossimlabs allows one to install and configure an entire local cluster for trying and testing the binary distribution of [OSSIM](https://github.com/ossimlabs/ossim) and the new [OMAR](https://github.com/ossimlabs/omar) version 2 also known as the O2 distribution.

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


All services are running on their own VM and are reachable directly.  The direct IPs are listed in the vagrant file and are not listed here.  The httpd VM is a proxy to the web services and are reached via the 192.168.2.200 proxy.  Here we show how to display the health of a VM.  If the VM is up and running you should see 

```JSON
{"status":"UP"}
```


* [http://192.168.2.200/wmts-app/health](http://192.168.2.200/wmts-app/health)
* [http://192.168.2.200/wms-app/health](http://192.168.2.200/wms-app/health)
* [http://192.168.2.200/wfs-app/health](http://192.168.2.200/wfs-app/health)
* [http://192.168.2.200/omar-app/health](http://192.168.2.200/omar-app/health)
* [http://192.168.2.200/swipe-app/health](http://192.168.2.200/swipe-app/health)
* [http://192.168.2.200/stager-app/health](http://192.168.2.200/stager-app/health)
* [http://192.168.2.200/superoverlay-app/health](http://192.168.2.200/superoverlay-app/health)

Some of the URLs have *Swagger* API documentation and can be reached by adding the api path to the URL:

* [http://192.168.2.200/wmts-app/api](http://192.168.2.200/wmts-app/api)
* [http://192.168.2.200/wms-app/api](http://192.168.2.200/wms-app/api)
* [http://192.168.2.200/wfs-app/api](http://192.168.2.200/wfs-app/api)
* [http://192.168.2.200/omar-app/api](http://192.168.2.200/omar-app/api)
* [http://192.168.2.200/swipe-app/api](http://192.168.2.200/swipe-app/api)
* [http://192.168.2.200/stager-app/api](http://192.168.2.200/stager-app/api)
* [http://192.168.2.200/superoverlay-app/api](http://192.168.2.200/superoverlay-app/api)


# Notes

This section is reserved for notes that are usuful for the vagrant environment.

##NFS Share and password prompting

If you do not want to be prompted for a password when doing NFS share mount modifications in Vagrant you can add a NOPASSWD definition to the sudoers file.  On the MAC we use the admin group and add a definition to the /etc/sudoers:

```bash
%admin  ALL=(ALL) NOPASSWD: ALL
```
*On the MAC there might be an entry already present in sudoers for the admin group and you just need to add the "NOPASSWD:" to the entry*

Other groups can be used for other flavors of linux.  For others the common super group might be called %wheel instead of %admin.