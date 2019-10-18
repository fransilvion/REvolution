#' Fitness: F(X)
#'
#' Given an organism ran in the Game of Life.
#' Evaluate it's fitness based on a fitness-function.
#'
#'
#' @param inOrg The input organism-object
#' @param fun A fitness-evaluation function to be applied to each organism
#'
#' @return fit A numeric vector of the fitness of each organism
#'
#' @examples
#' organism_fitness <- Fitness(glider, "max_x")
#'
#' # There is a wrapper function to apply to `populations` directly
#' gliders_G0@fitness <- popFitness(gliders_G0)
#'
#' @export
Fitness <- function(inOrg, fun = "max_x"){
  # Convert the inOrg object to a binary matrix
  inOrg_l <- inOrg@cells

  if (fun == "max_x"){
    # fit is the largest X value
    # with a living cell
    #
    fit <- max( which(colSums(inOrg_l) > 0) )
  } else {
    stop("Error: Fitness evaluation function 'fun' was not found.")
  }
  return(fit)
}

popFitness <- function(inPop, fun = "max_x"){
  # Wrapper to apply Fitness function to a population object
  fit <- sapply(inPop@organisms, Fitness, fun = fun)
  return(fit)
}

## Example
# gliders_G0@fitness <- popFitness(gliders_G0)
