#' plotOrg
#'
#' Create a simple ggplot2 object for visualizing an organism in R.
#'
#' @param organism an IxJ binary matrix to be stored as an organism
#'
#' @return a ggplot2 plot object for organism
#'
#' @examples
#' # Plot basic glider organism
#' plotOrg(glider)
#'
#' @export
require(ggplot2)
require(reshape2)
plotOrg <- function(inOrg){
  # input an organism and print it
  orgData <- melt(inOrg@cells)

  orgPlot <-
    ggplot(orgData, aes(x = Var2, y = Var1, fill = value)) +
      geom_tile(show.legend = F) + scale_fill_manual(values = c("white", "black")) +
      scale_y_reverse() + coord_equal(ratio = 1) + theme_bw() +
      theme(panel.grid.major = element_line(linetype = "blank"),
            panel.grid.minor = element_line(linetype = "blank"),
            axis.title = element_text(colour = NA),
            axis.text = element_text(colour = NA),
            plot.title = element_text(colour = NA),
            panel.background = element_rect(fill = NA))
  return(orgPlot)
}
