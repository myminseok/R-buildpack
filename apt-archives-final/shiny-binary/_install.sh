#!/bin/bash


# fix R for staging env
cd /usr/lib/R/etc
rm Renviron
cp Renviron.orig Renviron
rm Makeconf
ln -s /etc/R/Makeconf Makeconf
rm ldpaths
ln -s /etc/R/ldpaths ldpaths

export EDITOR=vim

## shiny packages. 
## install order is important.
R CMD INSTALL --clean /r_packages/Rcpp_0.12.12_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/httpuv_1.3.5_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/mime_0.5_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/jsonlite_1.5_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/xtable_1.8-2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/digest_0.6.12_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/htmltools_0.3.6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/R6_2.2.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/sourcetools_0.1.6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/shiny_1.0.5_R_x86_64-pc-linux-gnu.tar.gz
# R -e "install.packages('shiny', repos='http://cran.us.r-project.org')"
