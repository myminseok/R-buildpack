#!/bin/bash
# https://github.com/rstudio/shiny-examples
# install.packages("Rcpp", repos='http://cran.us.r-project.org')
# install.packages("mime", repos='http://cran.us.r-project.org')
# install.packages("shiny", repos='http://cran.us.r-project.org')

R -e "shiny::runApp('./001-hello', port=8080, host='0.0.0.0')"
