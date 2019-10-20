#' generation
#'
#'
#'
#' @param
#' @param
#'
#' @return
#'
#' @examples
#'

#' @export
generateGenerationFirst <- function(gridsize, density, numOfOrganisms, folderName){

  popul <- c()
  for (i in 1:numOfOrganisms){
    org <- god(I = gridsize[1], J = gridsize[2], density = 0.5)
    mat2rle(org, paste(folderName, sprintf("/G0_org_%s.xlre", i), sep=""))
    popul <- c(popul, org)
  }
  gliders_G0 <- population( organisms = as.list(popul), fitness = rep(NA, numOfOrganisms) )
  return(gliders_G0)
}
