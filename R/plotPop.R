#' plotPop
#'
#' Create a plotly ggplot2 object for visualizing organisms in a population
#'
#' @param population a collection of organisms
#'
#' @return a ggplot2 plotly object
#'
#' @examples
#' # Plot basic glider organism
#' PLOT <- plotPop( glider_g0 )
#' ggplotly( PLOT  )
#'
#' @export
require(ggplot2)
require(plotly)
require(reshape2)
plotPop <- function(inPop){

  # How many individuals in population
  N <- length(inPop@organisms)

  # Dump the first organism logical to a data object
  orgData <- melt(inPop@organisms[[1]]@cells)
  orgData$n <- 1

  for (ind in 2:N){
    orgTmp <- melt(inPop@organisms[[ind]]@cells)
    orgTmp$n <- ind
    orgData <- rbind(orgData, orgTmp)
    }

  orgPlot <-
    ggplot(orgData, aes(x = Var2, y = Var1, fill = value)) +
      geom_tile(aes(frame = n), show.legend = F) + scale_fill_manual(values = c("white", "black")) +
      scale_y_reverse() + coord_equal(ratio = 1) + theme_bw() +
      theme(panel.grid.major = element_line(linetype = "blank"),
            panel.grid.minor = element_line(linetype = "blank"),
            axis.title = element_text(colour = NA),
            axis.text = element_text(colour = NA),
            plot.title = element_text(colour = NA),
            panel.background = element_rect(fill = NA))
  return(orgPlot)

}

#ggplotly( plotPop(glider_g0) )
