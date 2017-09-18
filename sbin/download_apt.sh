#!/bin/bash

### down-apt.sh libproj0 ./down_dir

package=$1
work_dir=$2

if [ -z $2 ]; then 	work_dir="./download"; fi
mkdir -p $work_dir
abs_work_dir=$(realpath $work_dir)

mkdir -p $abs_work_dir/archives/partial


apt-get -o debug::nolocking=true -o dir::cache=$work_dir build-dep -d -y  $package
cd $work_dir
apt-get download -y $package 