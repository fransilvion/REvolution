#' Build rGolly command
#'
#' Building the rGolly system command
#'
#'
#'
#' @param bgolly_path
#' @param input_rle
#' @param input_organism
#' @param output
#' @param generation
#' @param stepsize
#' @param maxmemory
#' @param maxtime
#' @param benchmark
#' @param exponential
#' @param rule
#' @param search
#' @param hashlife
#' @param algorithm
#' @param verbose
#' @param timeline
#' @param render
#' @param progress
#' @param popcount
#' @param scale
#' @param autofit
#' @param exec
#'
#'
#' @return None yet
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
                   maxtime = NULL, benchmark = NULL, exponential = NULL,
                   rule = NULL, search = NULL, hashlife = NULL, algorithm = NULL,
                   verbose = NULL, timeline = NULL, render = NULL,
                   progress = NULL, popcount = NULL, scale= NULL, autofit = NULL,
                   exec = NULL) {

  # Check that an input organism or RLE input file is provided
  if ( is.null(input_rle) & is.null(input_organism) ){
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
    purrr::list_modify("input_rle" = NULL) %>%
    purrr::list_modify("input_organism" = NULL) %>%
    utils::stack() %>%
    dplyr::mutate(cmd = paste0(" --", ind, " ", values))
  options(warn=0)
  # Get command as a string
  params <- paste(params$cmd,collapse = "")
  params <- paste(params, "-q -q")


  # If no output, print to standard output
  if (output == "stdout"){
    sys_comm <- paste0("bgolly", params, " --output stdout "," ", INPUT)
    testing <- paste0("system(", sys_comm, "intern = T, ignore.stderr =T )")
  } else {
    sys_comm <-  paste0("bgolly", params, " --output ", output," ", INPUT)
    testing <- paste0("system(", sys_comm, ")")
  }

  #system(sys_comm)

}

glider_logical <- matrix( data = c(F,T,F,
                                    F,F,T,
                                    T,T,T), nrow = 3, byrow = T)
glider <- organism(cells = glider_logical)

rGolly(input_organism = glider, generation = 2, stepsize = 3)

