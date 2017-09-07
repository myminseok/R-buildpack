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
R CMD INSTALL --clean /r_packages/Rcpp_0.12.12.tar.gz
R CMD INSTALL --clean /r_packages/httpuv_1.3.5.tar.gz
R CMD INSTALL --clean /r_packages/mime_0.5.tar.gz
R CMD INSTALL --clean /r_packages/jsonlite_1.5.tar.gz
R CMD INSTALL --clean /r_packages/xtable_1.8-2.tar.gz
R CMD INSTALL --clean /r_packages/digest_0.6.12.tar.gz
R CMD INSTALL --clean /r_packages/htmltools_0.3.6.tar.gz
R CMD INSTALL --clean /r_packages/R6_2.2.2.tar.gz
R CMD INSTALL --clean /r_packages/sourcetools_0.1.6.tar.gz
R CMD INSTALL --clean /r_packages/shiny_1.0.5.tar.gz
# R -e "install.packages('shiny', repos='http://cran.us.r-project.org')"

# ggplot2
## install order is important.
R CMD INSTALL --clean /r_packages/colorspace_1.3-2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/stringi_1.1.5_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/RColorBrewer_1.1-2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/dichromat_2.0-0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/munsell_0.4.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/labeling_0.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/viridisLite_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/rlang_0.1.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/gtable_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/plyr_1.8.4_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/reshape2_1.4.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/scales_0.5.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/tibble_1.3.4_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/lazyeval_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/ggplot2_2.2.1_R_x86_64-pc-linux-gnu.tar.gz



exit