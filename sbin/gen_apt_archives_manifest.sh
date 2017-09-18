#!/bin/bash
set -e

## 1. generate manifest_meta.yml 
##    gen_apt_archives_manifest.sh ./apt-archives 
## 2. copy  manifest_meta.yml into manifest.yml
## 3. build buildpack.

work_dir=$1
if [ -z $1 ]; then 	work_dir="."; fi
abs_path=$(realpath $work_dir)

outfile=$abs_path/_manifest_meta.yml
echo "" > $outfile

for FILE in $(ls -1 $abs_path/*.*); do
	filename=$(basename $FILE)
	if [[ $filename =~ .*manifest_meta.yml* ]]; then
		continue
	fi
	if [[ $filename =~ .*%.* ]]; then
	    new_filename=$(echo $filename | sed -e 's/\%/_/')
	    echo "!!! renaming incompatible filename: $filename => $new_filename" 
	    mv ${abs_path}/$filename ${abs_path}/$new_filename
	    filename=$new_filename
    fi 
#echo "${abs_path}/$filename"
echo "- name: $group${filename}" >> $outfile
echo "  version: 1" >> $outfile
echo "  uri: file://${abs_path}/${filename}" >> $outfile
echo "  md5: `md5 ${abs_path}/${filename} | awk '{print $4}'`" >> $outfile
echo "  cf_stacks:" >> $outfile
echo "  - cflinuxfs2" >> $outfile
done




 
echo "" >> $outfile
echo "compile_R" >> $outfile
echo "" >> $outfile



for FILE in $(ls -1 $abs_path/*.*); do
	filename=$(basename $FILE)
	if [[ $filename =~ .*%.* ]]; then
	    new_filename=$(echo $filename | sed -e 's/\%/_/')
	    echo "!!! renaming incompatible filename: $filename => $new_filename" 
	    mv ${abs_path}/$filename ${abs_path}/$new_filename
	    filename=$new_filename
    fi 
echo "\$BUILDPACK_DIR/bin/R/download_dependency \$BUILDPACK_DIR $filename 1 $filename " >> $outfile
done

 
echo "" >> $outfile
echo "fakeroot_install_r_packages.sh" >> $outfile
echo "" >> $outfile




for FILE in $(ls -1 $abs_path/*.*); do
	filename=$(basename $FILE)
	if [[ $filename =~ .*%.* ]]; then
	    new_filename=$(echo $filename | sed -e 's/\%/_/')
	    echo "!!! renaming incompatible filename: $filename => $new_filename" 
	    mv ${abs_path}/$filename ${abs_path}/$new_filename
	    filename=$new_filename
    fi 
echo "R CMD INSTALL --clean /r_packages/$filename" >> $outfile
done


echo "manifest meta file geneerated $outfile"
