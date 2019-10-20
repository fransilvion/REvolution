#' popMutationNotBest
#'
#'
#' Input population of organisms to undergo mutation
#' The best organism (with the biggest fitness is not mutated)
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
popMutationNotBest <- function(org_population, md = c("constant"), mut_rate_avg = 0.1, index_of_the_best) {
  list_of_org <- org_population@organisms

  if (index_of_the_best == 1){
    old_one = list_of_org[index_of_the_best]
    list_of_org <- purrr::map(list_of_org[2:length(list_of_org)], ~Mutation(.x, md, mut_rate_avg))
    list_of_org <- population(organisms = c(old_one, list_of_org),
                              fitness = org_population@fitness, maternal_line = org_population@maternal_line)
  } else if (index_of_the_best == length(list_of_org)){
    old_one = list_of_org[index_of_the_best]
    list_of_org <- purrr::map(list_of_org[1:(length(list_of_org)-1)], ~Mutation(.x, md, mut_rate_avg))
    list_of_org <- population(organisms = c(list_of_org, old_one),
                              fitness = org_population@fitness, maternal_line = org_population@maternal_line)
  } else {
    old_one = list_of_org[index_of_the_best]
    list_of_org_1 <- purrr::map(list_of_org[1:index_of_the_best-1], ~Mutation(.x, md, mut_rate_avg))
    list_of_org_2 <- purrr::map(list_of_org[(index_of_the_best+1):length(list_of_org)], ~Mutation(.x, md, mut_rate_avg))
    list_of_org <- population(organisms = c(list_of_org_1, old_one, list_of_org_2),
                              fitness = org_population@fitness, maternal_line = org_population@maternal_line)
  }
  return(list_of_org)
}

#examples
Gmut <- popMutationNotBest(old_population, md = c("constant"), 0.005)

old <- old_population@organisms
new <- Gmut@organisms

res <- c()
for (i in 1:100){
  res <- c(res, all(new[[i]]@cells == old[[i]]@cells))
}

