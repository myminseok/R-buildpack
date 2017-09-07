#!/bin/bash


export CHROOT_DIR="/home/vcap/app"
export PATH="$CHROOT_DIR/usr/bin:$CHROOT_DIR/usr/sbin:$CHROOT_DIR/usr/lib/rstudio-server:/sbin:/usr/sbin:$PATH"
export LD_LIBRARY_PATH="$CHROOT_DIR/usr/lib/x86_64-linux-gnu:$CHROOT_DIR/usr/lib/i386-linux-gnu:$CHROOT_DIR/usr/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CHROOT_DIR/usr/lib/x86_64-linux-gnu/fakechroot:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$CHROOT_DIR/usr/lib/x86_64-linux-gnu:$CHROOT_DIR/usr/lib/i386-linux-gnu:$CHROOT_DIR/usr/lib:$LIBRARY_PATH"
export INCLUDE_PATH="$CHROOT_DIR/usr/include:$INCLUDE_PATH"
export INCLUDE_PATH="/usr/include:/usr/share/R/include:/usr/lib/R/library/Matrix/include:$INCLUDE_PATH"
export CPATH="$INCLUDE_PATH"
export CPPPATH="$INCLUDE_PATH"
export PKG_CONFIG_PATH="$CHROOT_DIR/usr/lib/x86_64-linux-gnu/pkgconfig:$CHROOT_DIR/usr/lib/i386-linux-gnu/pkgconfig:$CHROOT_DIR/usr/lib/pkgconfig:$PKG_CONFIG_PATH"

# for R.
export EDITOR=vim

export DEBOOTSTRAP_DIR=/home/vcap/app/usr/share/debootstrap