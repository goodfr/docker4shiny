Docker container to get up to speed with shiny app
================

## Purpose

Dockerfile to test autobuild from dockerhub with right install of
packages. The idea is to gain time when building final image from
package.

## How to pull then use the image

``` docker
FROM project021018/shiny_r51:latest

# --- Get additional needed packages [OPTIONAL]
# RUN Rscript -e "install.packages('an.awesome.pkg')"

# --- Install R packages required by your Shiny app
COPY *.tar.gz /usr/local/lib/R/myapp.tar.gz

# --- Install your package
RUN Rscript -e "install.packages('myapp.tar.gz', source = TRUE, repos = NULL)"

# --- Launch your app
CMD ["R", "-e yourpkgapp::run_app()"]
```

The following packages have already been installed in base image (and
also a driver-connector to Hadoop Impala) : `DBI`, `odbc`, `data.table`,
`dplyr`, `httr`, `ggplot2`, `rstudioapi`, `gridExtra`, `tidyr`,
`shinycssloader`.
