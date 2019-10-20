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
  # Shifts to center the matrix
  x_shift <- inOrg@shift[1]
  y_shift <- inOrg@shift[2]

  #if matrix is of size 1,1 and has False - return -Inf
  if ((all(dim(inOrg_l) == c(1,1))) & (inOrg_l[1,1] == FALSE)){
    fit <- -Inf
    return(fit)
  }

  if (fun == "max_x"){
    # fit is the largest X value
    # with a living cell
    # TODO: This considers an 'organism' as only what
    # is defined by the matrix
    #
    # The `Shift` in organism is the "POS" offset
    # in extended RLE files from bgolly
    #
    # POS is the TOP-LEFT corner of the output matrix
    #
    #
    fit <- max( which(colSums(inOrg_l) > 0) )
    fit <- fit + x_shift

  } else if (fun == "env0"){
    # Fitness Function -- Environment 1
    # Optimize for EAST movement
    # Exponential Cost for N/S deviation
    fit <- max( which(colSums(inOrg_l) > 0) )
    fit <- fit + x_shift

    # Since Y-axis can be both positive and negative
    # subtract the matrix shift value from each row
    #
    # For y_shift = -3
    #  rowN   y_coordinate (reverse N, subtract y_shift)
    #     1 ->  2
    #     2 ->  1
    #     3 ->  0
    #     4 ->  -1
    #     5 ->  -2

    y_values <- nrow(inOrg_l):1 - (y_shift + 1)
    cost <- abs( y_values[ max( which(rowSums(inOrg_l) > 0) ) ] )

    fit <- fit - cost^2


  } else if (fun == "sum"){
    #sum of all elements in the matrix

    fit <- sum(inOrg_l)


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
