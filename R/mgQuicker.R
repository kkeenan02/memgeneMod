#' A simplified mgQuick function for extracting memgene eigenvectors without
#' significance testing, which is slow as hell!
#' 
#' Kevin Keenan, 2015
mgQuicker <- function(geoD, genD){
  # remove na in geoD
  geoD[is.na(geoD)] <- 0L
  genD <- as.matrix(genD)
  geoD <- as.matrix(geoD)
  # calculate mem varible for geoD
  mem <- memgeneMod::mgMEM(geoD)
  pos_mem <- mem$vectorsMEM[, mem$valuesMEM > 0]
  neg_mem <- mem$vectorsMEM[, mem$valuesMEM < 0]
  posRDA <- mgRDA(genD, pos_mem)
  
}