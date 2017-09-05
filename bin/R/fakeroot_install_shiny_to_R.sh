#!/bin/bash

. /root/.bashrc

# fix R for staging env
cd /usr/lib/R/etc
rm Renviron
cp Renviron.orig Renviron
rm Makeconf
ln -s /etc/R/Makeconf Makeconf
rm ldpaths
ln -s /etc/R/ldpaths ldpaths

export EDITOR=vim
R CMD INSTALL --clean /shiny_packages/Rcpp_0.12.12.tar.gz
R CMD INSTALL --clean /shiny_packages/httpuv_1.3.5.tar.gz
R CMD INSTALL --clean /shiny_packages/mime_0.5.tar.gz
R CMD INSTALL --clean /shiny_packages/jsonlite_1.5.tar.gz
R CMD INSTALL --clean /shiny_packages/xtable_1.8-2.tar.gz
R CMD INSTALL --clean /shiny_packages/digest_0.6.12.tar.gz
R CMD INSTALL --clean /shiny_packages/htmltools_0.3.6.tar.gz
R CMD INSTALL --clean /shiny_packages/R6_2.2.2.tar.gz
R CMD INSTALL --clean /shiny_packages/sourcetools_0.1.6.tar.gz
R CMD INSTALL --clean /shiny_packages/shiny_1.0.5.tar.gz

# R -e "install.packages('shiny', repos='http://cran.us.r-project.org')"
exit