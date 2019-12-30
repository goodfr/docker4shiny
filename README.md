Docker container to get up to speed with shiny app
================

## Purpose

Dockerfile to test autobuild from dockerhub with right install of
packages. The idea is to gain time when building final image from
package.

## How to pull the image

``` docker
FROM project021018/shiny_r51:1.0

# === get additional needed packages
# RUN Rscript -e "install.packages('shinycssloader')"
```

The following packages have been isntalled : `DBI`, `odbc`,
`data.table`, `dplyr`, `httr`, `ggplot2`, `rstudioapi`, `gridExtra`,
`tidyr`, `shinycssloader`.
