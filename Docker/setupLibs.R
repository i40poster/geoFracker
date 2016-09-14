#!/usr/bin/env Rscript
install.packages("rgeos")
install.packages("rgdal")
# raster install not working
install.packages('raster',  repos='http://cran.us.r-project.org')
install.packages('ncdf4')
install.packages("xlsx")
install.packages("ggmap")
library(raster)
library(rgdal)
source('downloadAndUnzipShp.R')
source('edificationSaoPaulo.R')
source('equipamentosSaoPaulo.R')
source('shapefilesProcessing.R')
