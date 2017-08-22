#!/bin/bash

#GCC_VERSION="4.3"
#export R_HOME=/app/vendor/R
#export R_INCLUDE=$R_HOME/lib64/R/include
#export PATH=$R_HOME/bin:/app/vendor/gcc-$GCC_VERSION/bin:$PATH
#export LD_LIBRARY_PATH="/lib:/usr/lib:$R_HOME/lib64:$LD_LIBRARY_PATH"
#export LIBRARY_PATH="/lib:/usr/lib:$R_HOME/lib64:$LD_LIBRARY_PATH"
export EDITOR=vim

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

# fix R env
#cd /usr/lib/R/etc
#rm /usr/lib/R/etc/Renviron
#cp Renviron.orig Renviron
#rm Makeconf
#ln -s /etc/R/Makeconf Makeconf
#rm ldpaths
#ln -s /etc/R/ldpaths ldpaths
