#' Generate_tree
#'
#' Given an ancestey object generate a phylogenetic tree
#' #Requires ape
#'
#' @param ancestry An ancestey object for the population
#' @param warnings Boolean for warning gneration (Default = TRUE)
#'
#' @return A phylogentic tree object for plotting
#'
#' @examples
#' Tree <- Generate_tree(Ancestry)
#' plot(Tree)
#'
#'
#' @export


Generate_tree<- function(inANS, warnings=TRUE){
  #Requires ape library
  require('ape')

  #Initalise history from final generation selection
  ancestey <- inANS@map
  hist <- as.data.frame(cbind(unique(ancestey[nrow(ancestey),])))
  colnames(hist) <- c("last")
  idx <- cbind(seq(1,length(unique(ancestey[nrow(ancestey),]))))
  ancestey <- ancestey[-c(nrow(ancestey)),]

  #Populate history
  for(g in seq(nrow(ancestey),1)){
    g_idx <- c()
    for(o in seq(1,nrow(hist))){
      g_idx <- append(g_idx, ancestey[g,hist[o,1]])
    }
    hist$gidx <- g_idx

    #Every generatrion merge branches
    if(length(hist$gidx) > length(unique(hist$gidx))){

      #Only activate for values where
      #there are items to merge
      for(val in unique(hist$gidx)){

        #Identify items to merge
        to_merge <- which(hist$gidx == val)
        if(length(to_merge) > 1){

          #Merge index values
          idx[to_merge][1] <- paste(idx[to_merge], collapse=',')

          #Remove merged values
          to_merge <- to_merge[-1]
          idx <- idx[-to_merge]
          hist <- hist[-to_merge,]
        }
      }
    }

    #Remove old genetation and
    #prepare for next generation
    hist$last <- hist$gidx
    idx <- sprintf('(%s)', idx)

    #Break and warn if 1 branch is left
    if(length(idx) == 1){
      if(warnings == TRUE){
        warning("Reached one branch before calculating for all generations")
      }
      break
    }
  }

  #Convert index to string
  str <- paste( c('(',paste( unlist(idx), collapse=','),');'), collapse='')

  #Generate tree from string and return
  return(read.tree(text = str))
}
# tree2 <- Generate_tree(df)
# plot(tree2)
#Example plots for ape
#Phylogram
#plot(tree)
#plot(tree, type = 'phylogram')
#Cladogram
#plot(tree, type = 'cladogram')
#Fan
#plot(tree, type = 'fan')
#Unrooted
#plot(tree, type = 'unrooted')
#Radial
#plot(tree, type = 'radial')

