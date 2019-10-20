#' rGolly command for population
#'
#'
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

