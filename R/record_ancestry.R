#' Record Ancestry: rec_anc
#'
#' Records the ancestry of a population for later use
#'
#' @param inPop The input population-object
#' @param rec The current ancestry record (optional)
#'
#' @return A record of current ancestry data for the poulation
#'
#' @examples
#' inital_record <- rec_anc(inPop)
#' group_record <- rec_anc(inPop,rec)
#'
#'
#' @export
rec_anc <- function(inPop, rec){
  if(missing(rec)){
    return(ancestry( map = rbind(inPop@maternal_line)))
  }else{
    return(ancestry( map = rbind(rec@map,inPop@maternal_line)))
  }
}