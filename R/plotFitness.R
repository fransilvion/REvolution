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
  df <- data.frame(fitness = si_life@populations %>% purrr::map(~mean(.x@fitness)) %>% unlist(),
                   #org_number = rep(1:no_organisms, length(si_life@populations)),
                   gen = si_life@G)
  df[is.na(df)] <- 0

  ggplot(df, aes(x = gen, y = fitness)) +
    geom_line() +
    scale_x_continuous(limits = c(0,max(df$gen)), breaks = seq(0,max(df$gen),1), labels= paste0("G", unique(c(df$gen))))

}







