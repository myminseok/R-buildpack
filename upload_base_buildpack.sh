#!/bin/bash
set -e

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)


echo "cf delete-buildpack Rbase-buildpack -f"
# cf delete-buildpack Rbase-buildpack -f

echo "cf create-buildpack Rbase-buildpack $abs_path/Rbase_buildpack-cached-v0.1.0.zip 13 --enable -v"
#cf create-buildpack Rbase-buildpack $abs_path/Rbase_buildpack-cached-v0.1.0.zip 13 --enable


echo "cf update-buildpack Rbase-buildpack -p $abs_path/Rbase_buildpack-cached-v0.1.0.zip -v"
cf update-buildpack Rbase-buildpack -p $abs_path/Rbase_buildpack-cached-v0.1.0.zip
