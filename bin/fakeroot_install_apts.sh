#!/bin/bash

export APT_DIR=$1
echo "[fakeroot] $APT_DIR"
if [ $(find $APT_DIR -maxdepth 1 -name '*.deb' -type f | wc -l ) -eq 0 ]; then
    echo "[fakeroot] no deb in $APT_DIR"
    exit
fi

echo "[fakeroot] Install apts"
for DEB in $(ls -1 $APT_DIR/*.deb); do
    echo "[fakeroot] Installing apt $DEB"
    dpkg -x $DEB /
done
## exit fakeroot
exit