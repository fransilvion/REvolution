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

plotFitness <- function(si_life, no_organisms) {
  df <- data.frame(fitness = si_life@populations %>% purrr::map(~.x@fitness) %>% unlist(),
                   org_number = rep(1:no_organisms, length(si_life@populations)),
                   gen = rep(si_life@G, no_organisms) %>% sort())
  df[is.na(df)] <- 0

  ggplot(df, aes(x = gen, y = fitness, group = org_number)) +
    geom_line() +
    scale_x_continuous(limits = c(0,max(df$gen)), breaks = seq(0,max(df$gen),1), labels= paste0("G", unique(c(df$gen))))

}







