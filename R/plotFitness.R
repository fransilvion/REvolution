#' plotFitness
#'
#' plot the fitness of organism function
#' Input Lineage object
#'
#'
#'
#'
#' @param file_path
#'
#' @return A list of organism-class object
#'
#' @examples
#'
#'
#'
#'
#' @export
#'
#'


# # Example of a glider encoded as logical matrix
 glider_logical <- matrix( data = c(F,T,F,
                                    F,F,T,
                                    T,T,T), nrow = 3, byrow = T)

 # Example of a glider encoded as an organism
 glider <- organism(cells = glider_logical)

 # Inverse of the glider above
 glider_inv <-  organism(cells = !attr(glider, "cells"))

 gliders_G0 <- population( organisms = list( glider, glider_inv), fitness = c(NA,NA) )

 gliders_G1 <-  popMutation(gliders_G0, "constant", 0.3)
 gliders_G1@fitness <- c(2,2)

 gliders_G2 <- popMutation(gliders_G1, "constant", 0.3)
 gliders_G2@fitness <- c(3,5)

 si_life <- lineage( populations = list(gliders_G0, gliders_G1, gliders_G2), G = c(0,1,2) )


plotFitness <- function(si_life, no_organisms) {
  df <- data.frame(fitness = si_life@populations %>% purrr::map(~.x@fitness) %>% unlist(),
                   org_number = rep(1:no_organisms, length(si_life@populations)),
                   gen = rep(si_life@G, no_organisms) %>% sort())
  df[is.na(df)] <- 0

  ggplot(df, aes(x = gen, y = fitness, group = org_number)) +
    geom_line() +
    scale_x_continuous(limits = c(0,max(df$gen)), breaks = seq(0,max(df$gen),1), labels= paste0("G", unique(c(df$gen))))

}







