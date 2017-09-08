#!/bin/bash

export APT_DIR=$1
#echo "[root] checking apt files in $APT_DIR"
if [ $(find $APT_DIR -maxdepth 1 -name '*.deb' -type f | wc -l ) -eq 0 ]; then
    echo "[root] no deb found in $APT_DIR"
    exit
fi

echo "[root] Install apt package list (it takes time...)"
dpkg -A -R $APT_DIR > /dev/null 2>&1  

for DEB in $(ls -1 $APT_DIR/*.deb); do
    #echo "[root] Installing apt $(basename $DEB)"  
    dpkg -i $DEB  > /dev/null 2>&1    
done
#echo "[root] dpkg -C"
#dpkg -C
echo "[root] dpkg --configure --pending"
dpkg --configure --pending
echo "[root] apt-get install -fy"
apt-get install -fy
echo ""
echo "DONE"
## to exit from fakechroot
exit