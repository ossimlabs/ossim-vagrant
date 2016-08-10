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


Once the VMs are up and running you can browse to the main Web UI by following  [https://192.168.2.200/omar-app/omar](https://192.168.2.200/omar-app/omar)


All services are running on their own VM and are reachable directly.  The direct IPs are listed in the vagrant file and are not listed here.  The httpd VM is a proxy to the web services and are reached via the 192.168.2.200 proxy.  Here we show how to display the health of a VM.  If the VM is up and running you should see 

```
{"status":"UP"}
```


* [https://192.168.2.200/wmts-app/health](https://192.168.2.200/wmts-app/health)
* [https://192.168.2.200/wms-app/health](https://192.168.2.200/wms-app/health)
* [https://192.168.2.200/wfs-app/health](https://192.168.2.200/wfs-app/health)
* [https://192.168.2.200/omar-app/health](https://192.168.2.200/omar-app/health)
* [https://192.168.2.200/swipe-app/health](https://192.168.2.200/swipe-app/health)
* [https://192.168.2.200/stager-app/health](https://192.168.2.200/stager-app/health)
* [https://192.168.2.200/superoverlay-app/health](https://192.168.2.200/superoverlay-app/health)
* [https://192.168.2.200/jpip-app/health](https://192.168.2.200/jpip-app/health)
* [https://192.168.2.200/sqs-app/health](https://192.168.2.200/sqs-app/health)

Some of the URLs have *Swagger* API documentation and can be reached by adding the api path to the URL:

* [https://192.168.2.200/wmts-app/api](https://192.168.2.200/wmts-app/api)
* [https://192.168.2.200/wms-app/api](https://192.168.2.200/wms-app/api)
* [https://192.168.2.200/wfs-app/api](https://192.168.2.200/wfs-app/api)
* [https://192.168.2.200/omar-app/api](https://192.168.2.200/omar-app/api)
* [https://192.168.2.200/swipe-app/api](https://192.168.2.200/swipe-app/api)
* [https://192.168.2.200/stager-app/api](https://192.168.2.200/stager-app/api)
* [https://192.168.2.200/superoverlay-app/api](https://192.168.2.200/superoverlay-app/api)
* [https://192.168.2.200/jpip-app/api](https://192.168.2.200/jpip-app/api)


# Notes

This section is reserved for notes that are usuful for the vagrant environment.

##NFS Share and password prompting

If you do not want to be prompted for a password when doing NFS share mount modifications in Vagrant you can add a NOPASSWD definition to the sudoers file.  On the MAC we use the admin group and add a definition to the /etc/sudoers:

```
%admin  ALL=(ALL) NOPASSWD: ALL
```
*On the MAC there might be an entry already present in sudoers for the admin group and you just need to add the "NOPASSWD:" to the entry*

Other groups can be used for other flavors of linux.  For others the common super group might be called %wheel instead of %admin.

##SSL Certificates

The environment has been setup to use a self-signed multi-domain SSL certificate for web proxy encryption and Java-Java process encryption. The certificates can be found in the /salt/httpd directory. The .csr, .key, and .pem files are all copied to the appropriate places on the apache server and the .pem file is applied to the Java cacerts chain for every machine with Java installed.

New certificates can be generated by running the following commands and replacing any relevant information. This was done using OSX with OpenSSL and an existing /data directory.

```
cp -f /System/Library/OpenSSL/openssl.cnf /data
echo '[ subject_alt_name ]' >> /data/openssl.cnf
echo 'subjectAltName = IP:192.168.2.100, IP:192.168.2.200, IP:192.168.2.101, IP:192.168.2.102, IP:192.168.2.103, IP:192.168.2.104, IP:192.168.2.105, IP:192.168.2.106, IP:192.168.2.107, IP:192.168.2.108, IP:192.168.2.120, IP:192.168.2.130, IP:192.168.2.140' >> /data/openssl.cnf
openssl req -x509 -nodes -newkey rsa:2048 \
  -config /data/openssl.cnf \
  -extensions subject_alt_name \
  -keyout oc2s.key \
  -out oc2s.pem \
  -subj '/C=XX/ST=XXXX/L=XXXX/O=XXXX/OU=XXXX/CN=www.radiantblue.com/emailAddress=postmaster@radiantblue.com'
openssl req -new -key /data/oc2s.key -out /data/oc2s.csr
```

#Jenkins HelloWorld Build VM

`vagrant up jenkins`

After provisioning you should see the echo of the URL and the Jenkins temporary root token ID for initial login.  When the jenkins is provisioned you will have installed and access to the latest development RPMS for the entire OSSIM baseline.  We will now do a simple guide for a vanilla hello world plugin build to test the build.  

After the vagrant up is performed you will need to copy the token ID echoed to the screen.  If you do not see it this might be because the jenkins didn't come up fast enough before the echo occured and you might need to run `vagrant provision jenkins` again to see it.  We did add a 60 second delay so it should print on first provision.


[http://192.168.2.150:8080/jenkins](http://192.168.2.150:8080/jenkins)


In this example we will build the simple vanilla **HelloWorldPlugin** provided on our github site.  First login and setup jenkins for initial use be taking the default setup and adding a user.  The user can be anything and is used to log into jenkins. Once the setup is complete create a new ***freeform project***.  We will use a simple shell script to build the plugin.  You can create a project with the name **HelloWorldPlugin**.  

* First, create a new job and give it a name **HelloWorldPlugin** then select freestyle project and hit Ok.
* Next add the git repo: https://github.com/ossimlabs/ossim-helloworld-plugin.git to the Source code management section of Jenkins project you just created and add to the ***Additoinal Behaviors*** to checkout the repo to a directory called ***ossim-helloworld-plugin***.  Select the additional behavior called **Checkout to a subdirectory**.  Make sure the branch is set to dev.
* Add a build step called **execute shell** and assuming that the OSSIM_VERSION is 1.9.0 then add a build shell with the following contents

```
export OSSIM_VERSION=1.9.0

mkdir -p ${WORKSPACE}/build
pushd ${WORKSPACE}/build
cmake ../ossim-helloworld-plugin -DCMAKE_INSTALL_PREFIX=${WORKSPACE}/install -DCMAKE_MODULE_PATH=/usr/share/ossim/1.9.0/CMakeModules
make install
popd
```
* Now hit save and hit the build button and start the build.