#' Plot population compositon: Pl_pc()
#'
#' Given an ancestry object generate a population composition graph
#' #Requires ggplot2
#'
#' @param ancestry An ancestry object for the population
#'
#' @return A plottable composiont graph
#'
#' @examples
#' pl <- Pl_pc(ancestry)
#' plot(pl)
#'
#'
#' @export

Pl_pc<- function(inANS){
  #Requires ggplot2 library
  require('ggplot2')
  
  #Initalise origin map
  ori <- inANS@map
  
  #Itterate and alter generation to have same origin as previous
  for(x in range(2,nrow(ori))){
    ori[x,] <- ori[x-1,][ori[x,]]
  }
  
  #Itterate and calculate portion of each generation for origins
  #And store as array
  data <- c()
  for(y in ori[1,]){
    data <- rbind(data,c(0,y,1/ncol(ori)))
  }
  for(x in range(2,nrow(ori))){
    for(y in ori[1,]){
      data <- rbind(data,c(x-1,y,length(which(ori[x,] == y))/ncol(ori)))
    }
  }

  #Free up space
  ori <- NA
  
  #Convert to data frame, chang orign to factor, and add names
  data <- as.data.frame(data)
  colnames(data) <- c("generation","origin","portion")
  data$origin <- as.factor(data$origin)
  
  #Return plot
  return(ggplot(data, aes(x=generation, y=portion, fill=origin)) + geom_area())
  
}
