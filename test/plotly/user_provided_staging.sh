#!/usr/bin/env bash

# fail fast
set -e


# parse and derive params
BUILDPACK_DIR=$1
CHROOT_DIR=$2

source $BUILDPACK_DIR/bin/R/staging_common.sh

topic "user provided staging.sh : Installing plotly apts from buildpack (cached)"
cd $CHROOT_DIR && mkdir -p $CHROOT_DIR/apts_from_buildpack && rm -rf $CHROOT_DIR/apts_from_buildpack/*
cp $BUILDPACK_DIR/apt-archives-final/plotly-dependency/*.deb $CHROOT_DIR/apts_from_buildpack
#fakechroot fakeroot chroot $CHROOT_DIR /fakeroot_install_apts_cached.sh /apts_from_buildpack 2>&1 | indent
rm -rf $CHROOT_DIR/apts_from_buildpack

echo "plotly DONE"