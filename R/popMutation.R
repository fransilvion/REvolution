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
popMutation <- function(org_population, md = c("constant", "poisson"), mut_rate_avg) {
  list_of_org <- org_population@organisms

  list_of_org <- purrr::map(list_of_org, ~Mutation(.x, md, mut_rate_avg))
  list_of_org <- population(organisms = list_of_org)
  return(list_of_org)

}
