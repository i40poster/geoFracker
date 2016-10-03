install.packages("deldir")
library("deldir")


#Source: http://stackoverflow.com/questions/36919805/r-how-to-color-voronoi-tesselation-by-data-value
#source: http://carsonfarmer.com/2009/09/voronoi-polygons-with-r/

geofracker.voronoipolygons = function(rawLayer) {
  require(deldir)
  #removing duplicated datadata
  zd <- zerodist(rawLayer)
  layer <- subset(rawLayer, !(1:nrow(rawLayer) %in% zd[,2]))
  crds = layer@coords
  z = deldir(crds[,1], crds[,2])
  w = tile.list(z)
  polys = vector(mode='list', length=length(w))
   my.variable = layer@data$eq_enderec   ## HERE position
   message("teste z:", length(z),"\r",appendLF=TRUE)
   message("teste w:", length(w),"\r",appendLF=TRUE)
   message("teste crds:", length(crds[,1]),"\r",appendLF=TRUE)


  require(sp)
  for (i in seq(along=polys)) {
      pcrds = cbind(w[[i]]$x, w[[i]]$y)
      pcrds = rbind(pcrds, pcrds[1,])
      polys[[i]] = Polygons(list(Polygon(pcrds)), ID=as.character(i))
  }
  SP = SpatialPolygons(polys)
   voronoi = SpatialPolygonsDataFrame(SP, data=data.frame(dummy = seq(length(SP)),
   voronoi.zone = my.variable, # HERE add new column to my voronoi data
   row.names=sapply(slot(SP, 'polygons'),
      function(x) slot(x, 'ID'))))
}
