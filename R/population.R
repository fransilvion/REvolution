#' population - class definition
#'
#' For each geneartion (G_i) in the Game of Evolution
#' There is a collection of `organism` objects which make up a population
#' which are competing with one another to survive to the next generation.
#'
#' This is the class definition of a list of organisms and their associated
#' fitness values
#'
#' @param organisms an ordered List of organism-objects
#' @param fitness an ordered Vector of numerical fitness-evaluation values for each organism in population. [NA]
#'
#' @return population
#'
#' @examples
#'
#' # The population at g0 is glider and inverse_glider organisms
#' # Fitness and maternal line are initially undefined
#' gliders_G0 <- population( organisms = list( glider, glider_inv), fitness = c(NA,NA) , maternal_line = c(NA,NA) )
#'
#' @export
population <- setClass(Class = "population", representation(organisms = "list", fitness = "vector", maternal_line = "vector"))

# # Example of a glider encoded as logical matrix
# glider_logical <- matrix( data = c(F,T,F,
#                                    F,F,T,
#                                    T,T,T), nrow = 3, byrow = T)
#
# # Example of a glider encoded as an organism
# glider <- organism(cells = glider_logical)
#
# # Inverse of the glider above
# glider_inv <-  organism(cells = !attr(glider, "cells"))
#
# gliders_G0 <- population( organisms = list( glider, glider_inv), fitness = c(NA,NA) , maternal_line = c(NA,NA) )

#QED
