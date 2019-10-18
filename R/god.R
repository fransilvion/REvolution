#' god
#'
#' The spark of all life in the Game of Evolution
#' aka organism initialization function
#'
#' Create a binary matrix of size I x J
#' and return it as an `organism` object
#'
#' @param I number of rows in organism
#' @param J number of columns in organism
#' @param density Range = [0,1]. Probabilty a given cell is set to 1
#'
#' @return An organism-class object
#'
#' @examples
#'
#' # Create a 9x9 matrix with 50% "on" density
#' god(I = 9, J = 9, density = 0.5)
#'
#' @export
god <- function(I, J, density) {
  # Create the logical matrix for an organism
  organism_l <- matrix(sample(0:1, I*J, replace=TRUE, prob=c(1-density, density)), I, J)
  organism_l <- organism_l > 0

  # Convert the logical matrix into an organism object
  org <- organism( cells = organism_l )
  return(org)
}
