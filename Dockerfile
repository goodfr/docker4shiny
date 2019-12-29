FROM project021018/shiny_r51:1.0

# === get needed packages
RUN Rscript -e "install.packages(c('shinycssloader'))" # 'DBI', 'odbc', 'data.table', 'dplyr', 'httr', 'ggplot2', 'rstudioapi', 'gridExtra', 'tidyr'

