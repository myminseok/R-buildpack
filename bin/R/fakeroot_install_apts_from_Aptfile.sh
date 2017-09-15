#!/bin/bash

set -e


function error() {
  echo " !     $*" >&2
  exit 1
}

function topic() {
  echo "-----> $*"
}

function indent() {
  c='s/^/       /'
  case $(uname) in
    Darwin) sed -l "$c";;
    *)      sed -u "$c";;
  esac
}

BUILD_DIR=$1
CHROOT_DIR=$2


if [ -s $BUILD_DIR/Aptfile ]; then
  mkdir -p $CHROOT_DIR/apts_from_aptfile/archives
  for PACKAGE in $(cat $BUILD_DIR/Aptfile); do
    if [[ $PACKAGE == *deb ]]; then
      PACKAGE_NAME=$(basename $PACKAGE .deb)
      PACKAGE_FILE=$CHROOT_DIR/apts_from_aptfile/$PACKAGE_NAME.deb
      topic "Fetching $PACKAGE"
      curl -s -L -z $PACKAGE_FILE -o $PACKAGE_FILE $PACKAGE 2>&1 | indent
    else
      topic "Fetching 2 .debs for $PACKAGE"
      fakechroot fakeroot chroot $CHROOT_DIR apt-get -o dir::cache=/apts_from_aptfile  -y --force-yes -d install --reinstall $PACKAGE 2>&1 | indent
      #fakechroot fakeroot chroot $CHROOT_DIR apt-get -o dir::cache=/apts_from_aptfile  -y  -d install  $PACKAGE 2>&1 | indent
    fi
  done

  #**************************************************************************************************
  ## archived apt files can be packaged into buildpack later.
  ## download using 'cf download-droplet <app-name> <local_file_path>'
  ## /apts_from_aptfile folder to download *.deb which can be use to make buildpack later.
  #**************************************************************************************************
  if [ $(find $CHROOT_DIR/apts_from_aptfile/archives -maxdepth 1 -name '*.deb' -type f | wc -l ) -gt 0 ]; then
    fakechroot fakeroot chroot $CHROOT_DIR /fakeroot_install_apts_cached.sh /apts_from_aptfile/archives 2>&1 | indent
    
  else
    echo "no *.deb fetched from 'Aptfile'. skip"  | indent
  fi
else
  echo "no 'Aptfile' uploaded. skip" | indent
fi
