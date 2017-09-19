#!/bin/bash
# fail fast
set -e


BUILDPACK_DIR=$1
CHROOT_DIR=$2
PACKAGE_NAME=$3
BINARY_DIR=$4
FORCE=$5

source $BUILDPACK_DIR/bin/R/staging_common.sh

DO_INSTALL=$(check_PACKAGES_env_variable $PACKAGE_NAME $FORCE)
if [ $DO_INSTALL != "true" ]; then
	#topic "skip installing pre-compiled R package '$PACKAGE_NAME' from buildpack (set env '$PACKAGE_NAME' in manifest.yml if need)"	      
	exit
fi


topic "Installing '$PACKAGE_NAME' package from buildpack (cached)"
if [ $(find $BINARY_DIR -maxdepth 1 -type f | wc -l ) -eq 0 ]; then
    echo "no deb found in $BINARY_DIR"
    exit
fi

cd $CHROOT_DIR && mkdir -p $CHROOT_DIR/apts_from_buildpack && rm -rf $CHROOT_DIR/apts_from_buildpack/*
cp $BINARY_DIR/* $CHROOT_DIR/apts_from_buildpack/
fakechroot fakeroot chroot $CHROOT_DIR /fakeroot_install_apts_cached.sh /apts_from_buildpack 2>&1 | indent
rm -rf $CHROOT_DIR/apts_from_buildpack/*
