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
require(purrr)
require(utils)
require(dplyr)
rGolly <- function(bgolly_path = "bgolly/bgolly",
                   input_rle = NULL, input_organism = NULL,
                   output = "stdout",
                   generation = NULL, stepsize=NULL, maxmemory= NULL,
                   maxtime = NULL, benchmark = NULL, exponential = NULL, quiet = NULL,
                   rule = NULL, search = NULL, hashlife = NULL, algorithm = NULL,
                   verbose = NULL, timeline = NULL, render = NULL,
                   progress = NULL, popcount = NULL, scale= NULL, autofit = NULL,
                   exec = NULL) {

  # Check that an input organism or RLE input file is provided
  if ( is.null(input_rle) | is.null(input_organism) ){
    stop("No input pattern provided. Use `organism = <glider>` or `input_rle = PATH_TO_RLE`")
  } else if ( !is.null(input_rle) ){
    # input RLE object is provided, read RLE into bgolly
    INPUT <- input_rle
  } else if ( !is.null(input_organism) ){
    # input organism object is provided, stream into bgolly directly
    INPUT <- "stdin"
  }

  # Read function parameters
  options(warn=-1)
  params <- as.list(match.call()) %>%
    purrr::list_modify("org_bin_matr" = NULL) %>%
    utils::stack() %>%
    dplyr::mutate(cmd = paste0(" --", ind, " ", values))
  options(warn=0)
  # Get command as a string
  params <- paste(params$cmd, "-q -q", collapse = "")


  # If no output, print to standard output
  if (output == "stdout"){
    sys_comm <- paste0("bgolly", params, " --output stdout "," ", INPUT)
    testing <- paste0("system(", sys_coom, "intern = T, ignore.stderr =T )")
  } else {
    sys_comm <-  paste0("bgolly", params, " --output ", output," ", INPUT)
    testing <- paste0("system(", sys_coom, ")")
  }

  print(sys_comm)
  #system(sys_comm)
  #return(output)

}


rGolly(org_bin_matr = "matrix.rle",generation = 2, stepsize = 3)

