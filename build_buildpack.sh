#!/bin/bash

## generate manifest script
# ./bin/gen_apt_archives_manifest.sh ./apt-archives

# git submodule update --init
# BUNDLE_GEMFILE=cf.Gemfile bundle
bundle exec buildpack-packager --cached


## test
# bundle exec buildpack-build

# cf delete-buildpack R-buildpack -f
# cf create-buildpack R-buildpack ./R_buildpack-cached-v0.1.0.zip 13 --enable
cf update-buildpack R-buildpack -p ./R_buildpack-cached-v0.1.0.zip   


