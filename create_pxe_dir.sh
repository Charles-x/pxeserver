#!/bin/sh
WORKDIR=/tmp
cd $WORKDIR
mkdir -p $WORKDIR/pxe/pxelinux.cfg/
cd $WORKDIR/pxe/
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
wget https://github.com/Charles-x/pxeserver/tree/master/pxe/pxelinux.0
wget https://github.com/Charles-x/pxeserver/tree/master/pxe/gpxelinux.0
wget https://github.com/Charles-x/pxeserver/tree/master/pxe/cloud-init.yml
wget https://github.com/Charles-x/pxeserver/tree/master/pxe/cloud-config.yml
cd $WORKDIR/pxe/pxelinux.cfg
wget https://github.com/Charles-x/pxeserver/tree/master/pxe/pxelinux.cfg/default
echo "----------------------you should to mount pxe dir to docker /pxe dir-----------------------------------"
