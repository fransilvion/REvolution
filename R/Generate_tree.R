#' Generate_tree: Sel(X)
#'
#' Given a population with recorded fitness.
#' Select best Y portion and repopulate.
#'
#'
#' @param ancestery A data frame matrix containing maternal line information (columns) for generations (rows)
#' @param final_gen A population object conatining the final generation post selection
#' @param warnings Boolean for warning gneration (Default = TRUE)
#'
#' @return A phylogentic tree object for plotting
#'
#' @examples
#' Tree <- Generate_tree(Ancestery, Gen_N)
#' plot(Tree)
#'
#'
#' @export


Generate_tree<- function(ancestery, final_gen, warnings=TRUE){
  #Requires ape library
  require('ape')
  
  #Initalise history from final generation selection
  hist <- as.data.frame(cbind(unique(final_gen@maternal_line)))
  colnames(hist) <- c("last")
  idx <- cbind(seq(1,length(unique(final_gen@maternal_line))))
  
  #Populate history
  for(g in seq(nrow(ancestery),1)){
    g_idx <- c()
    for(o in seq(1,nrow(hist))){
      g_idx <- append(g_idx, ancestery[g,hist[o,1]])
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

