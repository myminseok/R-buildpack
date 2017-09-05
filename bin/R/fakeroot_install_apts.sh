#!/bin/bash

export APT_DIR=$1
echo "[root] $APT_DIR"
if [ $(find $APT_DIR -maxdepth 1 -name '*.deb' -type f | wc -l ) -eq 0 ]; then
    echo "[root] no deb in $APT_DIR"
    exit
fi

echo "[root] Install apts"
for DEB in $(ls -1 $APT_DIR/*.deb); do
    #echo "[root] Installing apt $(basename $DEB)"
    echo -n "."
    dpkg -x $DEB /
done
echo "* DONE"
## to exit from fakechroot
exit