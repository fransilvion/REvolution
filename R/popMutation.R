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
#'
popMutation <- function(org_population, md = c("constant", "guassian", "poisson"), mut_rate_avg, mut_rate_sd= NULL) {
  list_of_org <- org_population@organisms

  purrr::map(list_of_org, ~Mutation(.x, md, mut_rate_avg, mut_rate_sd))
  list_of_org <- population(organisms = list_of_org)
  return(list_of_org)

}

#list_of_org <- population(organisms= list(glider, glider))
#hi <- popMutation(list_of_org, md = c("constant"), 0.3)
