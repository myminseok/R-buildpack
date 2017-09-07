#!/bin/bash

## apt-get install realpath

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)

for FILE in $(ls -1 $abs_path/*.tar.gz); do
	echo "$FILE"
	R CMD INSTALL --build $FILE
done

