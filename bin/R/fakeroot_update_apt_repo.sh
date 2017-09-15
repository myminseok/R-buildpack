#!/bin/bash

set -e


BUILD_DIR=$1
CHROOT_DIR=$2
CRAN_MIRROR="http://cran.ism.ac.jp"

source $BUILDPACK_DIR/bin/R/staging_common.sh

#topic "Detecting a new apt-get repo from env variable 'APT_REPO_UBUNTU'"
if [ ! -z $APT_REPO_UBUNTU ]; then
  ## APT_REPO_UBUNTU=http://91.189.88.161:80/ubuntu/
  ## 
  ## $CHROOT_DIR/etc/apt/sources.list
  ## deb http://archive.ubuntu.com/ubuntu trusty main
  ## => 
  ## deb http://192.168:8080/abc/ubuntu trusty main
  echo "Detected a new apt-get repo: $APT_REPO_UBUNTU" | indent
  sed -i "s|.*ubuntu.com.*|deb $APT_REPO_UBUNTU trusty main|g" $CHROOT_DIR/etc/apt/sources.list
  REPO_UPDATED="OK"
fi



if ! grep "$CRAN_MIRROR" $CHROOT_DIR/etc/apt/sources.list > /dev/null ; then
  echo "deb $CRAN_MIRROR/bin/linux/ubuntu trusty/" >> $CHROOT_DIR/etc/apt/sources.list 
  REPO_UPDATED="OK"
fi


#topic "Detecting a new apt-get repo from env variable 'APT_REPO_CRAN'"
if [ ! -z $APT_REPO_CRAN ]; then
  ## APT_REPO_CRAN=http://91.189.88.161:80/bin/linux/ubuntu
  ## $CHROOT_DIR/etc/apt/sources.list
  ## deb http://cran.ism.ac.jp/bin/linux/ubuntu trusty/
  echo "Detected a new apt-get repo: $APT_REPO_CRAN" | indent
  sed -i "s|.*$CRAN_MIRROR.*|deb $APT_REPO_CRAN trusty/|g" $CHROOT_DIR/etc/apt/sources.list
  REPO_UPDATED="OK"
fi


if [ ! -z $REPO_UPDATED ]; then
  cat $CHROOT_DIR/etc/apt/sources.list
  fakechroot fakeroot chroot $CHROOT_DIR dpkg --configure -a
  fakechroot fakeroot chroot $CHROOT_DIR apt-get update
  fakechroot fakeroot chroot $CHROOT_DIR apt-get install -f 
fi
