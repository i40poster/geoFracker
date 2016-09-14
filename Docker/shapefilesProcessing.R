saopaulo.data.processShapeLists <- function(listOfShape, filter) {

  for (sourcePath in listOfShape){

    print(sourcePath$shapeclass[1])
    print(length(sourcePath$shapeclass))
    # if the merged dataset doesn't exist, create it

    for (shapeSource in sourcePath$shapeclass){
      if(grepl(filter,shapeSource) ){
          print(shapeSource)
        if (!exists("dataset")){
          print("!exists")
          dataset <-  readOGR(dsn=sourcePath$dir[1], layer=shapeSource)
        } else {
          print("exists")
          temp_dataset <-  readOGR(dsn=sourcePath$dir[1], layer=shapeSource)
          #solves unique IDplot()
          #http://r-sig-geo.2731867.n2.nabble.com/invalid-class-SpatialPolygons-object-non-unique-Polygons-ID-slot-values-td7585420.html
          dataset <-rbind(dataset, temp_dataset, makeUniqueIDs = TRUE)
          rm(temp_dataset)
        }
      }
    }
  }
  return(dataset)
}

saopaulo.data.processShapeListsAsList <- function(listOfShape, filter) {

  i <- 0
  for (sourcePath in listOfShape){

    print(sourcePath$shapeclass[1])
    print(length(sourcePath$shapeclass))
    # if the merged dataset doesn't exist, create it

    for (shapeSource in sourcePath$shapeclass){
      if(grepl(filter,shapeSource) ){
        tryCatch({
              print(shapeSource)
            dataset <- readOGR(dsn=sourcePath$dir[1], layer=shapeSource)
            print(paste(shapeSource,"posdata set -->", i))
            if(!is.null(dataset)) {
              print(shapeSource)
              if (!exists("datasetList")){
                print("!exists")
                datasetList <-  list(dataset)
              } else {
                print(paste(shapeSource,"posdata else -->", i))
                #datasetListTemp <-  list(dataset)
                #append(datasetList,datasetListTemp)
                i <- i + 1
                datasetList[i] <- list(dataset)

                print(length(datasetList))
                #rm(datasetListTemp)
              }

            }
            rm(dataset)
            print(paste(shapeSource,"remove dataset"))
          }, warning = function(w) {
              print(paste(shapeSource,"warning",w))
          }, error = function(e) {
              print(paste(shapeSource,"error",))
          }, finally = {

          })

      }
    }
  }
  return(datasetList)
}


saopaulo.data.downloadBatch <- function(shapeslist){
  return(lapply(shapeslist,downloadAndUnzipShp))
}
