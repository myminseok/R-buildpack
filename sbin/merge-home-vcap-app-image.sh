#!/bin/bash

set -e

# folder to home_vcap_app_fakechroot.tar.gz.part
source_dir=$1
if [ -z $1 ]; then 	source_dir="."; fi
abs_source_dir=$(realpath $source_dir)

#echo "[root] checking apt files in $APT_DIR"
if [ $(find $abs_source_dir -maxdepth 1 -name 'home_vcap_app_fakechroot.tar.gz.part*' -type f | wc -l ) -eq 0 ]; then
    echo "[WARN] no target file named with 'home_vcap_app_fakechroot.tar.gz.part*' found in $abs_source_dir"
    exit 0
fi

SCRIPT_FILE="${BASH_SOURCE[0]}"
SCRIPT_DIR="$(dirname $SCRIPT_FILE)"
abs_script_dir=$(realpath $SCRIPT_DIR)

output_dir=$abs_script_dir/../base-image/home-vcap-app-image
mkdir -p $output_dir
## splited due to file size limit of 100MB in github
# merge home_vcap_app file
cat $abs_source_dir/home_vcap_app_fakechroot.tar.gz.part* \
> $output_dir/home_vcap_app_fakechroot-merged.tar.gz

echo "home_vcap_app_fakechroot.part* under $abs_path has been merged"
ls -lh $output_dir/home_vcap_app_fakechroot-merged.tar.gz

## geneate manifest.yml
##$abs_path/../gen_apt_archives_manifest.sh $abs_path
##echo ""
##md5sum=`md5 $abs_path/home_vcap_app_fakechroot-merged.tar.gz`
##echo "replace md5 to '$md5sum' for 'home_vcap_app_fakechroot-merged.tar.gz' in manifest_final.yml"

