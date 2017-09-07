#!/bin/bash

set -e

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)
echo "$abs_path"

if [[ ! $abs_path =~ .*/app ]]; then
	echo "[WARN] target folder name should be only 'app'" 
	exit 0
fi

cd $abs_path/..

#tar -zcf home_vcap_app_fakechroot.tar.gz  ./app > /dev/null 2>&1 
## split into 100M for github size limit.
#split -b 50000000 home_vcap_app_fakechroot.tar.gz "home_vcap_app_fakechroot.tar.gz.part"
tar -zcf - $abs_path | split -b 50000000 - "home_vcap_app_fakechroot.tar.gz.part"

echo "$abs_path/home_vcap_app_fakechroot.tar.gz.part* created"
