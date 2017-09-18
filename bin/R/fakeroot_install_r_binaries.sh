#!/bin/bash
# fail fast
set -e


BUILDPACK_DIR=$1
CHROOT_DIR=$2
PACKAGE_NAME=$3
BINARY_DIR=$4

source $BUILDPACK_DIR/bin/R/staging_common.sh

topic "Installing $PACKAGE_NAME package from buildpack (cached)"
if [ $(find $BINARY_DIR -maxdepth 1 -type f | wc -l ) -eq 0 ]; then
    echo "no package found in $BINARY_DIR"
    exit
fi
cd $CHROOT_DIR && mkdir -p $CHROOT_DIR/r_packages && rm -rf $CHROOT_DIR/r_packages/*
cp $BINARY_DIR/* $CHROOT_DIR/r_packages/
cp $BINARY_DIR/_install.sh  $CHROOT_DIR/ && chmod 777 $CHROOT_DIR/_install.sh
fakechroot fakeroot chroot $CHROOT_DIR /_install.sh 2>&1 | indent
rm -rf $CHROOT_DIR/r_packages/*