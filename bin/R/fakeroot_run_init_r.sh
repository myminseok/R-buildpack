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
R --no-save --quiet --slave --file=$1

## R -e "install.packages('shiny', repos='http://cran.us.r-project.org')"
## install.packages("mime", repos='http://cran.us.r-project.org')
## install.packages("Rcpp", repos='http://cran.us.r-project.org')
## install.packages("geoR", repos='http://cran.us.r-project.org')

exit