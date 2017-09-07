#!/bin/bash
source $HOME/app/.profile.d/r_environment.sh 
/home/vcap/app/usr/bin/fakechroot fakeroot /home/vcap/app/usr/sbin/chroot $HOME/app/ /bin/bash