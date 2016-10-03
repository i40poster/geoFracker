#' A Function to download and unzip a shapefile into a temp folder
#'
#' This function helps to manipulate the data available at GeoSampa website.
#' @param url to download the data.
#' @keywords url
#' @export
#' @examples
#' downloadAndUnzipShp("http://geosampa.prefeitura.sp.gov.br/PaginasPublicas/downloadArquivoOL.aspx?orig=DownloadCamadas&arq=03_Equipamentos%5C%5CAbastecimento%5C%5CShapefile%5C%5Cequipamento_abastecimento&arqTipo=Shapefile")

geofracker.downloadAndUnzipShp <- function(url) {
  require(tools)
  print(url)
  workdir <- paste(tempdir(), as.numeric(Sys.time()), sep="/")
  dir.create(workdir, showWarnings = TRUE, recursive = FALSE, mode = "0777")
  temp <- tempfile()
  download.file(url,temp)
  unzip(temp,exdir = workdir, junkpaths = TRUE)
  shapefiles = list.files(workdir,"*.shp")
  unlink(temp)
  result <- list("dir"=workdir,"shapefiles"=shapefiles,"shapeclass"=unlist(lapply(shapefiles,file_path_sans_ext)))

  return(result)
}
