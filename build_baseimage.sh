#!/bin/bash
set -e

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)

echo "merging home_vcap_app file ( to use pre compiled package for faster build)"
echo "$abs_path/bin/R/merge-home-vcap-app-image.sh $abs_path/apt-archives/home-vcap-app-image/"
$abs_path/bin/R/merge-home-vcap-app-image.sh $abs_path/apt-archives/home-vcap-app-image/

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
echo "	$abs_path/upload_buildpack.sh "
echo ""
echo "[you need to]  pushing app to get staged image"
echo "	cd $abs_path/test/build_base_image"
echo "	cf push"
echo ""
echo "[you need to] download the base image from PCF container"
echo "	mkdir temp && cd ./temp"
echo "	cf download-droplet build-app ./droplet"
echo "	tar xf ./droplet"
echo "	mv  ./app/home_vcap_app_fakechroot.tar.gz* to $abs_path/apt-archives/home-vcap-app-image/"
echo ""
echo "[you need to]  merging home_vcap_app file"
echo "	$abs_path/bin/R/merge-home-vcap-app-image.sh $abs_path/apt-archives/home-vcap-app-image/"
echo ""