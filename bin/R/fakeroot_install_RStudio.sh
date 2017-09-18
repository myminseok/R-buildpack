#!/bin/bash
# apt-get install gdebi-core -y 
# wget https://download2.rstudio.org/rstudio-server-1.0.153-amd64.deb
# gdebi rstudio-server-1.0.153-amd64.deb
# rstudio-server verify-installation
# rstudio-server start
# http://192.168.11.225:8787

. /root/.bashrc
gdebi /rstudio_packages/rstudio-server-1.0.153-amd64.deb
rstudio-server verify-installation
