#!/bin/bash

. /root/.bashrc

. /.profile.d/r_environment.sh

## 
mkdir -p ./src/contrib/PACKAGES

R -e "shiny::runApp('/001-hello', port=8080, host='0.0.0.0')"