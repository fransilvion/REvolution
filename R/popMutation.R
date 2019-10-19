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

glider_pop <- population(organisms= list(glider, glider), fitness = c(NA,NA) )

glider_pop@organisms[1]
gliders_G0@organisms[1]

popMutation(glider_pop, md = c("constant"), 0.5)
popMutation(gliders_G0, md = c("constant"), 0.5)

