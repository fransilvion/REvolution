#' rGolly command for population
#'
#'
#'
#'
#'
#' @param org_population population object
#' @param bgolly_path path to bgolly
#' @param input_rle rle matrix
#' @param input_organism  organism object
#' @param output output file
#' @param generation How far to run
#' @param stepsize Step size
#' @param maxmemory Max memory to use in megabytes
#' @param maxtime Max duration
#' @param benchmark Show timestamps
#' @param exponential Use exponentially increasing steps
#' @param rule Life rule to use
#' @param search Search directory for .rule files
#' @param hashlife Use Hashlife algorithm
#' @param algorithm Select algorithm by name
#' @param verbose Verbose
#' @param timeline Use timeline
#' @param render Render benchmarking
#' @param progress Render during progress dialog debugging
#' @param popcount Popcount benchmarking
#' @param scale Rendering scale
#' @param autofit Autofit before each render
#' @param exec Run testing script
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

