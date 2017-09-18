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

R CMD INSTALL --clean /r_packages/Cairo_1.5-9_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/DT_0.2_R_x86_64-pc-linux-gnu.tar.gz

