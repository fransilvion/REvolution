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
popMutation <- function(org_population, md = c("constant"), mut_rate_avg = 0.1) {
  list_of_org <- org_population@organisms

  list_of_org <- purrr::map(list_of_org, ~Mutation(.x, md, mut_rate_avg))
  list_of_org <- population(organisms = list_of_org, fitness = org_population@fitness, maternal_line = org_population@maternal_line)
  return(list_of_org)

}


