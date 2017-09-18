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

R CMD INSTALL --clean /r_packages/dplyr_0.7.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/httr_1.3.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/curl_2.8.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/binman_0.1.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/plogr_0.1-1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/purrr_0.2.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/BH_1.65.0-1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/udunits2_0.13_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/assertthat_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/modeltools_0.2-21_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/DEoptimR_1.0-8_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/bindr_0.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/prettyunits_1.0.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/bitops_1.0-6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/backports_1.1.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/mnormt_1.5-5_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/mclust_5.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/flexmix_2.3-14_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/prabclus_2.2-6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/diptest_0.75-7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/mvtnorm_1.0-6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/robustbase_0.92-7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/kernlab_0.9-25_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/trimcluster_0.1-2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/gridExtra_2.3_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/udunits2_0.13_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/subprocess_0.8.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/semver_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/rappdirs_0.3.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/xml2_1.1.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/openssl_0.9.7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/yaml_2.1.14_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/glue_1.1.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/tidyselect_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/assertthat_0.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/bindrcpp_0.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/pkgconfig_2.0.1_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/BH_1.65.0-1_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/plogr_0.1-1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/progress_1.1.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/reshape_0.8.7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/crayon_1.3.4_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/praise_1.0.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/evaluate_0.10.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/highr_0.6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/markdown_0.8_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/stringr_1.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/memoise_1.1.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/whisker_0.3-2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/rstudioapi_0.7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/git2r_0.19.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/withr_2.0.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/caTools_1.17.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/rprojroot_1.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/psych_1.7.8_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/fpc_2.1-10_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/viridis_0.4.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/DBI_0.7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/units_0.4-6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/XML_3.98-1.9_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/wdman_0.2.2_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/binman_0.1.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/repr_0.12.0_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/httr_1.3.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/magrittr_1.5_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/base64enc_0.1-3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/htmlwidgets_0.9_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/tidyr_0.7.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/hexbin_1.27.1_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/dplyr_0.7.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/crosstalk_1.0.0_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/purrr_0.2.3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/data.table_1.10.4_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/maps_3.2.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/ggthemes_3.4.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/GGally_1.3.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/testthat_1.0.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/knitr_1.17_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/devtools_1.13.3_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/curl_2.8.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/rmarkdown_1.6_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/Rserve_1.7-3_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/RSclient_0.7-3_R_x86_64-pc-linux-gnu.tar.gz
#R CMD INSTALL --clean /r_packages/Cairo_1.5-9_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/broom_0.4.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/webshot_0.4.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/listviewer_1.4.0_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/dendextend_1.5.2_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/sf_0.5-4_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/RSelenium_1.7.1_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/png_0.1-7_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/IRdisplay_0.4.4_R_x86_64-pc-linux-gnu.tar.gz
R CMD INSTALL --clean /r_packages/plotly_4.7.1_R_x86_64-pc-linux-gnu.tar.gz
