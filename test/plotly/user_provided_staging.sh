#!/usr/bin/env bash

# fail fast
set -e

# debug
# set -x

# parse and derive params
BUILDPACK_DIR=$1
CHROOT_DIR=$2

source $BUILDPACK_DIR/bin/R/staging_common.sh

topic "Installing plotly apts from buildpack (cached)"
cd $CHROOT_DIR && mkdir -p $CHROOT_DIR/apts_from_buildpack && rm -rf $CHROOT_DIR/apts_from_buildpack/*
cp $BUILDPACK_DIR/apt-archives-buildpack/plotly-dependency/*.deb $CHROOT_DIR/apts_from_buildpack
fakechroot fakeroot chroot $CHROOT_DIR /fakeroot_install_apts_cached.sh /apts_from_buildpack 2>&1 | indent
rm -rf $CHROOT_DIR/apts_from_buildpack


topic "Installing plotly r from buildpack (cached)"
cd $CHROOT_DIR && mkdir -p $CHROOT_DIR/r_packages && rm -rf $CHROOT_DIR/r_packages/*
cp $BUILDPACK_DIR/apt-archives-buildpack/plotly-r-binary/* $CHROOT_DIR/r_packages/
cp $BUILDPACK_DIR/apt-archives-buildpack/plotly-r-binary/_install.sh  $CHROOT_DIR/
chmod 777 $CHROOT_DIR/_install.sh
fakechroot fakeroot chroot $CHROOT_DIR /_install.sh 2>&1 | indent
rm -rf $CHROOT_DIR/r_packages

echo "plotly DONE"