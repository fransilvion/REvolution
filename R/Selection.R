#' Selection: Sel(X)
#'
#' Given a population with recorded fitness.
#' Select best Y portion and repopulate.
#'
#'
#' @param inPop The input organism-object
#' @param por The portion of population to keep for gen n+1 (Default = 0.1)
#'
#' @return A population of the same size generated from the top portion
#'
#' @examples
#' Gn+1 <- Selection(Gn, "surviving_portion")
#'
#'
#' @export
Selection <- function(inPop, por = 0.1){
  # Check that population contains values
  if(anyNA(inPop@fitness)){stop("Error: Population finess vector contians null values")}
  
  #Check that there is a fitness for every organsism
  l <- length(inPop@fitness)
  if(l != length(inPop@organisms)){stop("Error: Lenght of orgnaisms and fitenss do not match")}
  
  #Collect indexes for the top Y protion 
  #Note: rounds up number of organsisms
  min <- sort(inPop@fitness, partial=1+l-l*por)[1+l-l*por]
  idx <- which(inPop@fitness >= min)
  
  #Duplicates indexes of indivividuals to repopulate
  idx <- sort(rep(idx, ceiling(1/(length(idx)/l))))
  #Randomly cull excess individuals
  if(length(idx) > l){
    idx <- idx[-sample(1:length(idx),length(idx)-l)]
  }
  #Return population generated from top Y portion
  return(population( organisms = inPop@organisms[idx], fitness = rep(NA,l), maternal_line = as.vector(idx)))
}

## Example
#Generate pop form top 1% of G0
# G1 <- Seletion(G0,0.01)



