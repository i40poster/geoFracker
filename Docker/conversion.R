# helper function to convert maps at the south hemisphere:
geofracker.utm2decimalSouth <- function(data,zone,datum){
    #coordinates(newData) <- c("easting","northing")
    crs <- paste0("+proj=utm+zone=",zone,"+datum=",datum)
    data@proj4string@projargs <- paste0("+proj=utm"," +south  +zone=",zone," +datum=",datum)
    spTransform(data, CRS("+proj=longlat"))}


geofracker.utm2decimalNorth <- function(data,zone,datum){
        #coordinates(newData) <- c("easting","northing")
        crs <- paste0("+proj=utm+zone=",zone,"+datum=",datum)
        data@proj4string@projargs <- paste0("+proj=utm","  +zone=",zone," +datum=",datum)
        spTransform(data, CRS("+proj=longlat"))}
