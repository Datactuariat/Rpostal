#' postal_expand
#' Converts messy real-world addresses into normalized equivalents suitable for search indexing, hashing, etc.
#'
#' @param adr string
#' @param libpostal_path path to libpostal (default : ~/libpostal/src/)
#'
#' @return Adresses expansions
#' @export
#'
#' @examples
#' adr1 <- "Quatre vignt douze Ave des Champs-Élysées"
#' adr2 <- "Sept R. des frères Lumiere, 92500 Rueil-Malmaison"
#' 
#' postal_expand(adr1)
#' #$`Quatre vignt douze Ave des Champs-Élysées.expansions`
#' #[1] "92 avenue des champs-elysees" 
#' #[2] "92 avenue des champs elysees"
#' #[3] "92 avenue des champselysees" 
#' 
#' postal_expand(c(adr1,adr2))

postal_expand <- Vectorize(function(adr,libpostal_path="~/libpostal/src/"){
  require(jsonlite)
  adr <- gsub("\"","",adr)
  req <- paste0(libpostal_path,"libpostal \"",adr,"\" --json")
  sys <- system(req,intern=TRUE)
  out <- fromJSON(paste(sys,collapse=""))
  return(out)
})
