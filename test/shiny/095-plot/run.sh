#!/bin/bash

#. /root/.bashrc

. /.profile.d/r_environment.sh

## 
mkdir -p ./src/contrib/PACKAGES

export FONTCONFIG_PATH=/etc/fonts

R -e "shiny::runApp('/', port=8080, host='0.0.0.0')"
