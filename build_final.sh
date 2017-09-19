#!/bin/bash
set -e


SCRIPT_FILE="${BASH_SOURCE[0]}"
script_script_dir=$(realpath $SCRIPT_FILE)
script_dir=$(dirname "${script_script_dir}")

echo "merging home_vcap_app file"
$script_dir/sbin/merge-home-vcap-app-image.sh $script_dir/base-image/home-vcap-app-image/

echo ""
echo "replacing $script_dir/bin/compile_final  => $script_dir/bin/compile"
cp $script_dir/bin/compile_final $script_dir/bin/compile
echo "replacing $script_dir/manifest_final.yml => $script_dir/manifest.yml"
cp $script_dir/manifest_final.yml $script_dir/manifest.yml

echo ""
echo "packging R-buildpack"
if [ ! -d $script_dir/compile-extensions ]; then
  git submodule update --init
fi

BUNDLE_GEMFILE=cf.Gemfile bundle

echo "	bundle exec buildpack-packager --cached"
bundle exec buildpack-packager --cached
echo "buidpack packaged"
echo ""

## test
# bundle exec buildpack-build

echo ""
echo "[you need to] upload buildpack to cloud foundry"
echo "	$script_dir/upload_buildpack.sh "
echo ""
echo "[you need to] pushing app"
echo ""
echo "	cd $script_dir/test/shiny/001-hello"
echo "	cf push"
echo ""
