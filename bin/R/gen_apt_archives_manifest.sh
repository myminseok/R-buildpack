#!/bin/bash
#!/bin/bash

## 1. generate manifest_meta.yml 
##    gen_apt_archives_manifest.sh ./apt-archives 
## 2. copy  manifest_meta.yml into manifest.yml
## 3. build buildpack.

abs_path=$(realpath $1)

outfile=$abs_path/manifest_meta.yml
echo "" > $outfile

for DEB in $(ls -1 $abs_path/*.deb); do
	filename=$(basename $DEB)
	if [[ $filename =~ .*%.* ]]; then
	    new_filename=$(echo $filename | sed -e 's/\%/_/')
	    echo "!!! renaming incompatible filename: $filename => $new_filename" 
	    mv ${abs_path}/$filename ${abs_path}/$new_filename
	    filename=$new_filename
    fi 
echo "${abs_path}/$filename"
echo "- name: ${filename}" >> $outfile
echo "  version: 1" >> $outfile
echo "  uri: file://${abs_path}/${filename}" >> $outfile
echo "  md5: `md5 ${abs_path}/${filename} | awk '{print $4}'`" >> $outfile
echo "  cf_stacks:" >> $outfile
echo "  - cflinuxfs2" >> $outfile
done

