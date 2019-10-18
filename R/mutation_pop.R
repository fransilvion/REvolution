#' mutation
#'
#' organism mutation_pop function
#' Input population of organisms to undergo mutation
#'
#' Accepts list of binary matrix
#' and returns a list of `organism`
#'
#' @param file_path
#'
#' @return A list of organism-class object
#'
#' @examples
#'
#'
#'
#'
#' @export


mutation_pop <- function(list_of_org, md = c("constant", "guassian", "poisson"), mut_rate_avg, mut_rate_sd= NULL) {

  purrr::map(list_of_org, ~mutation(.x, md, mut_rate_avg, mut_rate_sd))

}

list_of_org <- list(glider, glider)

mutation_pop(list_of_org, md = c("constant"), 0.3)
