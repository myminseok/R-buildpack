#!/bin/bash

## should run outside of fakeroot. (not in fakechroot env)

rm_symlink() {
  if [ -h $* ]; then
  	rm $*
  fi
}

echo "Start to Fix broken symbolic link in fakeroot"
export CHROOT_DIR="/home/vcap/app"


cp /lib/x86_64-linux-gnu/ld-2.19.so $CHROOT_DIR/lib/x86_64-linux-gnu/ld-2.19.so
rm_symlink $CHROOT_DIR/lib64/ld-linux-x86-64.so.2 && ln -s /lib/x86_64-linux-gnu/ld-2.19.so $CHROOT_DIR/lib64/ld-linux-x86-64.so.2

cp /lib/systemd/systemd-udevd $CHROOT_DIR/lib/systemd/systemd-udevd
rm_symlink $CHROOT_DIR/sbin/udevd && ln -s /lib/systemd/systemd-udevd $CHROOT_DIR/sbin/udevd

rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libthread_db.so && ln -s /lib/x86_64-linux-gnu/libthread_db.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libthread_db.so 
rm_symlink $CHROOT_DIR/lib/x86_64-linux-gnu/libthread_db.so.1 && ln -s /lib/x86_64-linux-gnu/libthread_db-1.0.so $CHROOT_DIR/lib/x86_64-linux-gnu/libthread_db.so.1

rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libm.so && ln -s /lib/x86_64-linux-gnu/libm.so.6 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libm.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/librt.so && ln -s /lib/x86_64-linux-gnu/librt.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/librt.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_compat.so && ln -s /lib/x86_64-linux-gnu/libnss_compat.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_compat.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_dns.so && ln -s /lib/x86_64-linux-gnu/libnss_dns.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_dns.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_nisplus.so && ln -s /lib/x86_64-linux-gnu/libnss_nisplus.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_nisplus.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libutil.so && ln -s /lib/x86_64-linux-gnu/libutil.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libutil.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libBrokenLocale.so && ln -s /lib/x86_64-linux-gnu/libBrokenLocale.so.6 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libBrokenLocale.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libcrypt.so && ln -s /lib/x86_64-linux-gnu/libcrypt.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libcrypt.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libcidn.so && ln -s /lib/x86_64-linux-gnu/libcidn.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libcidn.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libdl.so  && ln -s /lib/x86_64-linux-gnu/libdl.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libdl.so 
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_nis.so && ln -s /lib/x86_64-linux-gnu/libnss_nis.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_nis.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libanl.so && ln -s /lib/x86_64-linux-gnu/libanl.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libanl.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_hesiod.so && ln -s /lib/x86_64-linux-gnu/libnss_hesiod.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_hesiod.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_files.so && ln -s /lib/x86_64-linux-gnu/libnss_files.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnss_files.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnsl.so && ln -s /lib/x86_64-linux-gnu/libnsl.so.1 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libnsl.so
rm_symlink $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libresolv.so && ln -s /lib/x86_64-linux-gnu/libresolv.so.2 $CHROOT_DIR/usr/lib/x86_64-linux-gnu/libresolv.so

cp /lib/x86_64-linux-gnu/libgcc_s.so.1 $CHROOT_DIR/lib/x86_64-linux-gnu/libgcc_s.so.1
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc_s.so  &&  ln -s /lib/x86_64-linux-gnu/libanl.so.1 $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc_s.so
mkdir -p $CHROOT_DIR/usr/lib/x86_64-linux-gnu/glib-2.0 && cp -R /usr/lib/x86_64-linux-gnu/glib-2.0/* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/glib-2.0/
rm_symlink $CHROOT_DIR/usr/bin/glib-compile-resources && ln -s /usr/lib/x86_64-linux-gnu/glib-2.0/glib-compile-resources $CHROOT_DIR/usr/bin/glib-compile-resources
rm_symlink $CHROOT_DIR/usr/bin/gio-querymodules && ln -s  /usr/lib/x86_64-linux-gnu/glib-2.0/gio-querymodules $CHROOT_DIR/usr/bin/gio-querymodules
rm_symlink $CHROOT_DIR/usr/bin/glib-compile-schemas && ln -s  /usr/lib/x86_64-linux-gnu/glib-2.0/glib-compile-schemas $CHROOT_DIR/usr/bin/glib-compile-schemas
mkdir -p $CHROOT_DIR/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0 && cp -R /usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/
rm_symlink $CHROOT_DIR/usr/bin/gdk-pixbuf-query-loaders && ln -s /usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders $CHROOT_DIR/usr/bin/gdk-pixbuf-query-loaders
mkdir -p $CHROOT_DIR/usr/lib/openblas-base && cp -r /usr/lib/openblas-base/* $CHROOT_DIR/usr/lib/openblas-base && cp -r /usr/lib/libopenblas* $CHROOT_DIR/usr/lib/
mkdir -p $CHROOT_DIR/usr/lib/lapack && cp -r /usr/lib/lapack/* $CHROOT_DIR/usr/lib/lapack
mkdir -p $CHROOT_DIR/etc/newt &&  cp -r /etc/newt/* $CHROOT_DIR/etc/newt/
mkdir -p $CHROOT_DIR/etc/console-setup  && cp /etc/console-setup/vtrgb $CHROOT_DIR/etc/console-setup/vtrgb
rm_symlink $CHROOT_DIR/usr/share/aptitude/COPYING


cp -r /usr/lib/x86_64-linux-gnu/libgfortran.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libgfortran.so  && ln -s /usr/lib/x86_64-linux-gnu/libgfortran.so.3  $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libgfortran.so

cp -r /usr/lib/x86_64-linux-gnu/libtsan.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libtsan.so && ln -s /usr/lib/x86_64-linux-gnu/libtsan.so.0 $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libtsan.so

cp -r /usr/lib/x86_64-linux-gnu/libquadmath.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libquadmath.so && ln -s /usr/lib/x86_64-linux-gnu/libquadmath.so.0 $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libquadmath.so

cp -r /usr/lib/x86_64-linux-gnu/libatomic.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libatomic.so && ln -s /usr/lib/x86_64-linux-gnu/libatomic.so.1 $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libatomic.so

cp -r /usr/lib/x86_64-linux-gnu/libgomp.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libgomp.so && ln -s /usr/lib/x86_64-linux-gnu/libgomp.so.1  $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libgomp.so

cp -r /usr/lib/x86_64-linux-gnu/libasan.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libasan.so && ln -s /usr/lib/x86_64-linux-gnu/libasan.so.0  $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libasan.so 

cp -r /usr/lib/x86_64-linux-gnu/libitm.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libitm.so && ln -s /usr/lib/x86_64-linux-gnu/libitm.so.1   $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libitm.so

cp -r /usr/lib/x86_64-linux-gnu/libstdc++.so* $CHROOT_DIR/usr/lib/x86_64-linux-gnu/
rm_symlink $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libstdc++.so  && ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6   $CHROOT_DIR/usr/lib/gcc/x86_64-linux-gnu/4.8/libstdc++.so


rm_symlink $CHROOT_DIR/usr/lib/R/etc/repositories && ln -s /etc/R/repositories $CHROOT_DIR/usr/lib/R/etc/repositories
rm_symlink $CHROOT_DIR/usr/lib/R/etc/Renviron.site && ln -s /etc/R/Renviron.site $CHROOT_DIR/usr/lib/R/etc/Renviron.site
rm_symlink $CHROOT_DIR/usr/lib/R/etc/Rprofile.site && ln -s /etc/R/Rprofile.site $CHROOT_DIR/usr/lib/R/etc/Rprofile.site
rm_symlink $CHROOT_DIR/usr/lib/R/etc/ldpaths && ln -s /etc/R/ldpaths $CHROOT_DIR/usr/lib/R/etc/ldpaths
rm_symlink $CHROOT_DIR/usr/lib/R/etc/Makeconf && ln -s /etc/R/Makeconf $CHROOT_DIR/usr/lib/R/etc/Makeconf
rm_symlink $CHROOT_DIR/usr/lib/R/COPYING 
rm_symlink $CHROOT_DIR/usr/share/R/doc/COPYING
rm_symlink $CHROOT_DIR/usr/share/aptitude/COPYING
rm_symlink $CHROOT_DIR/usr/share/groff/site-tmac && ln -s /etc/groff $CHROOT_DIR/usr/share/groff/site-tmac



rm -rf $CHROOT_DIR/run && mkdir -p $CHROOT_DIR/run  && cp -r /run/network $CHROOT_DIR/run
rm -rf $CHROOT_DIR/usr/share/doc
rm -rf $CHROOT_DIR/etc/alternatives/yaccman

echo "Complete to Fix broken symbolic link in fakeroot"
