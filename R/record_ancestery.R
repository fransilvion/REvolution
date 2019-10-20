#' Record Ancestery: rec_anc
#'
#' Records the ancestery of a population for later use
#'
#' @param inPop The input population-object
#' @param rec The current ancestery record (optional)
#'
#' @return A record of current ancestery data for the poulation
#'
#' @examples
#' ancestery_record <- rec_anc(inPop)
#'
#'
#' @export
rec_anc <- function(inPop, rec){
  if(missing(rec)){
    return(ancestery( map = rbind(inPop@maternal_line)))
  }else{
    print(rec@map)
    print('----')
    return(ancestery( map = rbind(rec@map,inPop@maternal_line)))
  }
}