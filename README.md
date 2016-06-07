#OSSIMLABS Vagrant Binary Distribution

**dependencies**:

* Install [Vagrant](https://www.vagrantup.com/downloads.html) for your OS
* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS 
* Network Connection
* git client
* CPU/BIOS supporting 64 bit virtualization



#Introduction

ossim-vagrant module under ossimlabs allows one to install and configure an entire local cluster for trying and testing the binary distribution of [OSSIM](https://github.com/ossimlabs/ossim) and the new [OMAR](https://github.com/ossimlabs/omar) version 2 also known as the O2 distribution.

```
git clone https://github.com/ossimlabs/ossim-vagrant.git
cd ossim-vagrant
git checkout dev  # checkout dev if desired to use latest and greatest
```
Now edit the vagrant file and make sure that you set a NFS share directory where your data resides.

  config.vm.synced_folder \<source directory>, "/data", type: "nfs"
 
where **\<source directory>** is a directory on your computer that you wish to NFS share and will be mounted on all the VM instances to location **/data**.

By default the **sqsApp** settings will come up and will expect the **pillar/ossim.sls** to be edited with the proper credentials.  The variables must be defined:

```
cd ossim-vagrant
vi pillar/ossim.sls
```
under the yaml root **ossim:sqs-app:** the variables need to be populated with proper locations and credentials

 * **queue** The AWS SQS queue to pull messages from.
 * **aws-access-key-id** The Credentials for the key ID.
 * **aws-secret-access-key** The Secret Key


If you do not want to have the sqsApp come up then you must comment the app lication out in the Vagrant file definition.


Now bring up all the VMs

```
vagrant up
```

The **vagrant up** command will bring up the following VMs **httpd**, **postgres**, **WMTS**, **Stager**, **WMS**, **WFS**, **SuperOverlay**, **Swipe**, **OMAR Web UI** for a total of 9 VMs.  The vagrant id for each are as follows: **httpd**, **postgres**, **wmtsApp**, **stagerApp**, **wmsApp**, **wfsApp**, **superoverlayApp**, **swipeApp**, **omarApp**.

Each individual vagrant WM instance can be specified if you do not want to bring all the VMs up at once.   For instance,  if you just want to use the wmts interface it uses the WMS, and WFS and we will need the proxy and the postgres database.  To get data into the system add the stagerApp VM.  We can issue the following command to specify individual VM instances.

```
vagrant up postgres httpd wmsApp wfsApp stagerApp wmtsApp
```

This will bring up each application individually and connect them together.  If you want to ssh into any of the instances that are up you can do

```
vagrant ssh stagerApp
```

which will ssh into the stager WM without having to type the password.


Once the VMs are up and running you can browse to the main Web UI by following  [http://192.168.2.200/omar-app/omar](http://192.168.2.200/omar-app/omar)


All services are running on their own VM and are reachable directly.  The direct IPs are listed in the vagrant file and are not listed here.  The httpd VM is a proxy to the web services and are reached via the 192.168.2.200 proxy.  Here we show how to display the health of a VM.  If the VM is up and running you should see 

```
{"status":"UP"}
```


* [http://192.168.2.200/wmts-app/health](http://192.168.2.200/wmts-app/health)
* [http://192.168.2.200/wms-app/health](http://192.168.2.200/wms-app/health)
* [http://192.168.2.200/wfs-app/health](http://192.168.2.200/wfs-app/health)
* [http://192.168.2.200/omar-app/health](http://192.168.2.200/omar-app/health)
* [http://192.168.2.200/swipe-app/health](http://192.168.2.200/swipe-app/health)
* [http://192.168.2.200/stager-app/health](http://192.168.2.200/stager-app/health)
* [http://192.168.2.200/superoverlay-app/health](http://192.168.2.200/superoverlay-app/health)
* [http://192.168.2.200/jpip-app/health](http://192.168.2.200/jpip-app/health)
* [http://192.168.2.200/sqs-app/health](http://192.168.2.200/sqs-app/health)

Some of the URLs have *Swagger* API documentation and can be reached by adding the api path to the URL:

* [http://192.168.2.200/wmts-app/api](http://192.168.2.200/wmts-app/api)
* [http://192.168.2.200/wms-app/api](http://192.168.2.200/wms-app/api)
* [http://192.168.2.200/wfs-app/api](http://192.168.2.200/wfs-app/api)
* [http://192.168.2.200/omar-app/api](http://192.168.2.200/omar-app/api)
* [http://192.168.2.200/swipe-app/api](http://192.168.2.200/swipe-app/api)
* [http://192.168.2.200/stager-app/api](http://192.168.2.200/stager-app/api)
* [http://192.168.2.200/superoverlay-app/api](http://192.168.2.200/superoverlay-app/api)
* [http://192.168.2.200/jpip-app/api](http://192.168.2.200/jpip-app/api)


# Notes

This section is reserved for notes that are usuful for the vagrant environment.

##NFS Share and password prompting

If you do not want to be prompted for a password when doing NFS share mount modifications in Vagrant you can add a NOPASSWD definition to the sudoers file.  On the MAC we use the admin group and add a definition to the /etc/sudoers:

```
%admin  ALL=(ALL) NOPASSWD: ALL
```
*On the MAC there might be an entry already present in sudoers for the admin group and you just need to add the "NOPASSWD:" to the entry*

Other groups can be used for other flavors of linux.  For others the common super group might be called %wheel instead of %admin.