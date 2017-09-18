#!/bin/bash
set -e

echo "$0 [target_dir]"

script_file=$0
script_abs_path=$(realpath $script_file)
script_dir=$(dirname "${script_abs_path}")


target_dir=$1
if [ -z $1 ]; then 	target_dir=$script_dir/../base-image/home-vcap-app-image/ ; fi
target_abs_path=$(realpath $target_dir)


temp_dir=$script_file/../temp
rm -rf $temp_dir
mkdir $temp_dir && cd $temp_dir
echo "* download the base image from PCF container"
cf download-droplet rbaseimage ./droplet
tar xf ./droplet
echo "* copying to $target_abs_path"
mv  ./app/home_vcap_app_fakechroot.tar.gz* $target_abs_path
rm -rf $temp_dir
echo "* merging files"
$script_dir/merge-home-vcap-app-image.sh $target_abs_path