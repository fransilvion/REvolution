#' generateGenerationFirst
#'
#' function that generates population of initial organisms for Game of Evolution
#'
#' @param gridsize - vector of length 2: number of rows and number of columns
#' @param density - density of active cells
#' @param numOfOrganisms - number of organisms
#' @param folderName - output folder
#'
#' @return returns population object with generated random organisms
#'
#' @examples
#' popG0 <- generateGenerationFirst(c(100,100), 0.5, 100, "~/Desktop/test_bgolly/G0")

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
