#!/bin/bash
set -e

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)

echo "merging home_vcap_app file ( to use pre compiled package for faster build)"
$abs_path/base-image/merge-home-vcap-app-image.sh $abs_path/base-image/home-vcap-app-image/

echo ""
echo "replacing $abs_path/bin/compile_base_image  => $abs_path/bin/compile"
cp $abs_path/bin/compile_base_image $abs_path/bin/compile
echo "replacing $abs_path/manifest_base_image.yml => $abs_path/manifest.yml"
cp $abs_path/manifest_base_image.yml $abs_path/manifest.yml


echo "packging R-buildpack"
# git submodule update --init
# BUNDLE_GEMFILE=cf.Gemfile bundle
echo "	bundle exec buildpack-packager --cached"
bundle exec buildpack-packager --cached
echo "buidpack packaged"
echo ""
echo ""
echo "[you need to] upload buildpack to cloud foundry"
echo "	$abs_path/upload_base_buildpack.sh "
echo ""
echo "[you need to]  pushing app to get staged image"
echo "	cd $abs_path/test/build_base_image"
echo "	cf push"
echo ""
echo "[you need to] download the base image from PCF container "
echo "	run this script anyfolder : R-buildpack/base-image/download_base_image_from_droplet.sh"

