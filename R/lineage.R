#' lineage - class definition
#'
#' The population for a geneartion (G_i) is processed
#' through the Game of Evolution to yield the next generation (G_i+1).
#'
#' Every jth generation, the `population` will be written to the `lineage`
#' object which can be used for tracking changes and plotting
#'
#' @param populations An ordered list of populations at geneartions Gi, Gi+j, Gi+2j, ...
#' @param G An ordered numerical vector of generation numbers for each population c(Gi, Gi+j,...)
#'
#' @return lineage
#'
#' @examples
#'
#'
#' @export
#'
lineage <- setClass(Class = "lineage", representation(populations = "list", G = "vector"))

# # Example of a glider encoded as logical matrix
# glider_logical <- matrix( data = c(F,T,F,
#                                    F,F,T,
#                                    T,T,T), nrow = 3, byrow = T)
#
# # Example of a glider encoded as an organism
# glider <- organism(cells = glider_logical)
#
# # Inverse of the glider above
# glider_inv <- !attr(glider, "cells")
#
# gliders_G0 <- population( organisms = list( glider, glider_inv), fitness = c(NA,NA) )
#
# gliders_G1 <- gliders_G0 # gliders_G1 <- mutate(gliders_G0)
#
# si_life <- lineage( populations = list(gliders_G0, gliders_G1), G = c(0,1) )

#QED
