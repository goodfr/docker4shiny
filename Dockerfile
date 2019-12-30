FROM rocker/shiny:3.6.0

# === update unix
RUN apt-get update 
RUN apt-get install -y libssl-dev 
RUN apt-get install -y unixodbc-dev 
RUN apt-get install -y libxml2-dev
RUN apt-get install wget -y

# === To allow connexion to Impala
RUN cd /tmp \
wget --no-verbose https://downloads.cloudera.com/connectors/impala_odbc_2.5.41.1029/Debian/clouderaimpalaodbc_2.5.41.1029-2_amd64.deb \
dpkg -i clouderaimpalaodbc_2.5.41.1029-2_amd64.deb \
odbcinst -i -d -f /opt/cloudera/impalaodbc/Setup/odbcinst.ini

# === Install R packages required by your Shiny app
COPY *.tar.gz /usr/local/lib/R/myapp.tar.gz

# === Get needed packages
RUN Rscript -e "install.packages(c('DBI', 'odbc', 'data.table', 'dplyr', 'httr', 'ggplot2', 'rstudioapi', 'gridExtra', 'tidyr', 'shinycssloader'))"

# === Install your package
RUN Rscript -e "install.packages('myapp.tar.gz', source = TRUE, repos = NULL)"

# === (From Thinkr) To expose port 3838 in app (shinyapp)
COPY Rprofile.site /usr/local/lib/R/etc
EXPOSE 3838
CMD ["R", "-e yourpkgapp::run_app()"]