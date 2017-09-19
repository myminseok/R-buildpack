#!/bin/bash
set -e

echo "$0 [target_dir]"

SCRIPT_FILE="${BASH_SOURCE[0]}"
script_script_dir=$(realpath $SCRIPT_FILE)
script_dir=$(dirname "${script_script_dir}")


target_dir=$1
if [ -z $1 ]; then 	target_dir=$script_dir/../base-image/home-vcap-app-image/ ; fi
target_abs_path=$(realpath $target_dir)


temp_dir=$script_dir/../temp
rm -rf $temp_dir
mkdir $temp_dir && cd $temp_dir
echo "* download the base image from PCF container"
cf download-droplet rbaseimage ./droplet
tar xf $temp_dir/droplet
echo "* copying to $target_abs_path"
mv  $temp_dir/app/home_vcap_app_fakechroot.tar.gz* $target_abs_path
rm -rf $temp_dir
echo "* merging files"
cd $script_dir
$script_dir/merge-home-vcap-app-image.sh $target_abs_path