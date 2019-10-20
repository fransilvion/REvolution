#' rGolly command for population
#'
#'
#'
#'
#' @param org_population tmp
#' @param bgolly_path tmp
#' @param input_rle tmp
#' @param input_organism tmp
#' @param output tmp
#' @param generation tmp
#' @param stepsize tmp
#' @param maxmemory tmp
#' @param maxtime tmp
#' @param benchmark tmp
#' @param exponential tmp
#' @param rule tmp
#' @param search tmp
#' @param hashlife tmp
#' @param algorithm tmp
#' @param verbose tmp
#' @param timeline tmp
#' @param render tmp
#' @param progress tmp
#' @param popcount tmp
#' @param scale tmp
#' @param autofit tmp
#' @param exec tmp
#'
#' @return None yet
#'
#' @examples
#'
#'
#'
#' @export
#'


require(purrr)
poprGolly <- function(org_population = NULL,
                      bgolly_path = "bgolly/bgolly",
                      input_rle = NULL, input_organism = NULL,
                      output = "stdout",
                      generation = NULL, stepsize=NULL, maxmemory= NULL,
                      maxtime = NULL, benchmark = NULL, exponential = NULL,
                      rule = NULL, search = NULL, hashlife = NULL, algorithm = NULL,
                      verbose = NULL, timeline = NULL, render = NULL,
                      progress = NULL, popcount = NULL, scale= NULL, autofit = NULL,
                      exec = NULL) {

  # Check that a population object was provided
  if ( is.null(org_population ) ){
    stop("No population object provided.")
  } else if (!is.null(input_rle) | !is.null(input_organism)) {
    stop("Population required, not RLE or organism object")
  }

  list_of_org <- org_population@organisms

  list_of_org <- purrr::map(list_of_org, ~rGolly(input_organism = .x))
  list_of_org <- population(organisms = list_of_org, fitness = org_population@fitness, maternal_line = org_population@maternal_line)
  return(list_of_org)
}

