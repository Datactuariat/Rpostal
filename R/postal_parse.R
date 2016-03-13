#' postal_parse
#' Parse address into components.
#' @param adr string
#' @param libpostal_path path to libpostal (default : ~/libpostal/src/)
#'
#' @return Adresses components
#' @export
#'
#' @examples
#' postal_parse(c("Quatre vignt douze Ave des Champs-Élysées","sept rue des freres lumiere, Rueil-Malmaison"))

postal_parse <- Vectorize(function(adr,libpostal_path="~/libpostal/src/"){
  require(jsonlite)
  adr <- gsub("\"","",adr)
  req <- paste0("echo \"",adr,"\" |  ",libpostal_path,"address_parser")
  sys <- system(req,intern=TRUE)
  sys <- paste0(sys,collapse="")
  out <- tail(strsplit(sys,"Result:")[[1]],1)
  out <- fromJSON(out)
  return(out)
})
