FROM rocker/hadleyverse

MAINTAINER kx.it4poster@gmail.com

RUN sudo apt-get -y update && sudo apt-get install -y libgdal-dev libproj-dev

COPY *.R /home/rstudio/

RUN Rscript /home/rstudio/setupLibs.R
