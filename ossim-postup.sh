#!/bin/bash

# The CA Authorities have been updated since this box was built.
yum -y update ca-certificates
# OSSIM relies on some packages available in EPEL
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# Add the ossim repo
cat >/etc/yum.repos.d/ossim.repo <<-EOF
[ossim]
name=OSSIM Repo DEV
baseurl=http://s3.amazonaws.com/o2-rpms/CentOS/6/dev/x86_64/
enabled=1
EOF
sed 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.conf >> /etc/yum.conf
yum -y update
yum -y install java-1.8.0-openjdk-devel
yum -y install ossim
yum -y install ossim-gdal-plugin
yum -y install ossim-kakadu-plugin

# yum -y install http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm
# yum -y install postgresql94
# yum -y install postgresql94-server.x86_64
# yum -y install postgis2_94
# yum -y install proj
# yum -y install geos

# service postgresql-9.4 initdb
# cp /vagrant/pg_hba.conf /var/lib/pgsql/9.4/data/
# service postgresql-9.4 start
# psql -U postgres  -c 'CREATE DATABASE "omardb-1.8.20-prod"'
# psql -U postgres  -c 'CREATE EXTENSION POSTGIS' omardb-1.8.20-prod
# yum -y install ossim
# yum -y install ossim-gdal-plugin
# yum -y install ossim-kakadu-plugin
# yum -y install o2-omar-app
# chown -R vagrant:vagrant /opt/ossimlabs/omar-app

#yum -y install o2-*
