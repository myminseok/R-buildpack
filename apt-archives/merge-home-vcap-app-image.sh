#!/bin/bash

set -e

# folder to home_vcap_app_fakechroot.tar.gz.part
work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)

#echo "[root] checking apt files in $APT_DIR"
if [ $(find $abs_path -maxdepth 1 -name 'home_vcap_app_fakechroot.tar.gz.part*' -type f | wc -l ) -eq 0 ]; then
    echo "[WARN] no target file named with 'home_vcap_app_fakechroot.tar.gz.part*' found in $abs_path"
    exit 0
fi


# merge home_vcap_app file
cat $abs_path/home_vcap_app_fakechroot.tar.gz.part* \
> $abs_path/home_vcap_app_fakechroot-merged.tar.gz

echo "home_vcap_app_fakechroot.part* under $abs_path has been merged"
ls -lh $abs_path/home_vcap_app_fakechroot-merged.tar.gz

# geneate manifest.yml
$abs_path/../gen_apt_archives_manifest.sh $abs_path

echo ""
md5sum=`md5 $abs_path/home_vcap_app_fakechroot-merged.tar.gz`
echo "replace md5 to '$md5sum' for 'home_vcap_app_fakechroot-merged.tar.gz' in manifest_final.yml"

