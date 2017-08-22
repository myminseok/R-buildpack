#!/bin/bash
source /root/.bashrc

source /.profile.d/r_environment.sh
R -e "shiny::runApp('/shiny/001-hello', port=8080, host='0.0.0.0')"