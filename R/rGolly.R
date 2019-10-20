#' Build rGolly command
#'
#' Building the bGolly system command
#'
#'
#'
#' @param
#' @param
#'
#' @return
#'
#' @examples
#'
#'
#'
#' @export

rGolly <- function(org_bin_matr= NULL, generation = NULL, stepsize=NULL, maxmemory= NULL,
                   maxtime = NULL, benchmark = NULL, exponential = NULL, quiet = NULL,
                   rule = NULL, search = NULL, hashlife = NULL, algorithm = NULL,
                   output = NULL, verbose = NULL, timeline = NULL, render = NULL,
                   progress = NULL, popcount = NULL, scale= NULL, autofit = NULL,
                   exec = NULL) {

  # Is a the appropriate object/matrix provided?
  #if(is.null(org_bin_matr)) {
  #  return("A organism or object is required")
  #}

  # Get provided parameters
  options(warn=-1)
  params <- as.list(match.call()) %>%
    purrr::list_modify("org_bin_matr" = NULL) %>%
    utils::stack() %>%
    dplyr::mutate(cmd = paste0(" --", ind, " ", values))
  options(warn=0)

  # Get command as a string
  params <- paste(params$cmd, collapse = "")

  if(is.null(output)) {
    sys_comm <- paste0("bgolly", params, " --output stdout "," ", org_bin_matr)
  } else {
    sys_comm <-  paste0("bgolly", params, " --output ", output," ", org_bin_matr)
  }



  print(sys_comm)
  #system(sys_comm)
  #return(output)

}


rGolly(org_bin_matr = "matrix.rle",generation = 2, stepsize = 3)

