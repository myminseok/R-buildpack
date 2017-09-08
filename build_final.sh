#!/bin/bash
set -e

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)

echo "merging home_vcap_app file"
echo "$abs_path/apt-archives/merge-home-vcap-app-image.sh $abs_path/apt-archives/home-vcap-app-image/"
$abs_path/apt-archives/merge-home-vcap-app-image.sh $abs_path/apt-archives/home-vcap-app-image/

echo ""
echo "replacing $abs_path/bin/compile_final  => $abs_path/bin/compile"
cp $abs_path/bin/compile_final $abs_path/bin/compile
echo "replacing $abs_path/manifest_final.yml => $abs_path/manifest.yml"
cp $abs_path/manifest_final.yml $abs_path/manifest.yml

echo "packging R-buildpack"
# git submodule update --init
# BUNDLE_GEMFILE=cf.Gemfile bundle
echo "	bundle exec buildpack-packager --cached"
bundle exec buildpack-packager --cached
echo "buidpack packaged"
echo ""

## test
# bundle exec buildpack-build

echo ""
echo "[you need to] upload buildpack to cloud foundry"
echo "	$abs_path/upload_buildpack.sh "
echo ""
echo "[you need to] pushing app"
echo ""
echo "	cd $abs_path/test/shiny/001-hello"
echo "	cf push"
echo ""