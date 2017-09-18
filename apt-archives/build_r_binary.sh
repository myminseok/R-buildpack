#!/bin/bash
## run this script under R envirionment.
## provide package url can be found on install.package("plotly") in R
## ex) http://cloud.r-project.org/src/contrib/modeltools_0.2-21.tar.gz
## cat plotly.txt | grep http | awk  '{print $3}' | sed "s/'//g" > ./
set -e

SOURCE="${BASH_SOURCE[0]}"
echo "$SOURCE"


source_file_path=$1
abs_source_file_path=$(realpath $source_file_path)

work_dir=$(dirname $abs_source_file_path)

down_dir=$work_dir/download
out_dir=$work_dir/output
mkdir -p $down_dir
mkdir -p $out_dir


if [ -s $abs_source_file_path ]; then

  for PACKAGE_URL in $(cat $abs_source_file_path); do
      echo "$PACKAGE_URL"
      PACKAGE_NAME=$(basename $PACKAGE_URL)
      echo "$PACKAGE_NAME"
      if [[ $PACKAGE_URL != "#"* ]]; then
        wget $PACKAGE_URL -O $down_dir/$PACKAGE_NAME
        cd $out_dir && R CMD INSTALL --build $down_dir/$PACKAGE_NAME
        cd $work_dir
      fi

  done

fi