#!/bin/bash
set -e

echo "$0 [target_dir]"

script_file=$0
script_abs_path=$(realpath $script_file)
script_dir=$(dirname "${script_abs_path}")


target_dir=$1
if [ -z $1 ]; then 	target_dir=$script_dir/home-vcap-app-image/ ; fi
target_abs_path=$(realpath $target_dir)

rm -rf ./temp
mkdir ./temp && cd ./temp
echo "* download the base image from PCF container"
cf download-droplet rbaseimage ./droplet
tar xf ./droplet
echo "* copying to $target_abs_path"
mv  ./app/home_vcap_app_fakechroot.tar.gz* $target_abs_path
rm -rf ./temp
echo "* merging files"
$script_dir/../apt-archives/merge-home-vcap-app-image.sh $target_abs_path