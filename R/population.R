#' population - class definition
#'
#' For each geneartion (G_i) in the Game of Evolution
#' There is a collection of `organism` objects which make up a population
#' which are competing with one another to survive to the next generation.
#'
#' This is the class definition of a list of organisms and their associated
#' fitness values
#'
#' @param population Class definition for a list of organisms.
#'
#' @return None
#'
#' @examples
#'
#'
#' @export
population <- setClass(Class = "population", representation(organisms = "list", fitness = "vector"))

# Example of a glider encoded as logical matrix
glider_logical <- matrix( data = c(F,T,F,
                                   F,F,T,
                                   T,T,T), nrow = 3, byrow = T)

# Example of a glider encoded as an organism
glider <- organism(cells = glider_logical)

# Inverse of the glider above
glider_inv <- !attr(glider, "cells")

gliders_g0 <- population( organisms = list( glider, glider_inv), fitness = c(NA,NA) )

#QED
