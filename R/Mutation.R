#' Mutation
#'
#' organism mutation function
#' Input a binary organism matrix with selected mutation distribution selection
#'
#' Accepts a binary matrix
#' and returns a `organism` object
#'
#' @param org_bin_matr organism object
#' @param md mutation rate distrib
#' @param mut_rate_avg mutation rate mean for population
#'
#' @return An organism-class object
#'
#' @examples
#'
#'
#'
#'
#' @export


Mutation <- function(org_bin_matr, md = c("constant"), mut_rate_avg = 0.1) {
  # Create matrix to mutate
  org_mut <- as.logical(org_bin_matr@cells)

  # Get mutation rate
  if(md == "constant"){
    mut_rate = mut_rate_avg
  } else if(md == "poisson") {
    mut_rate = rpois(1, length(org_mut)*mut_rate_avg)/length(org_mut)
  } else if(!(md %in% c("constant", "poisson"))) {
    stop("Select either constant or poisson")
  }

  # Determine indices to mutate
  idx <- sample(1:length(org_mut), mut_rate*length(org_mut), replace = FALSE)

  # Mutate organism
  for (i in idx) {
    if(org_mut[i] == TRUE){
      org_mut[i] = FALSE
    } else {
      org_mut[i] = TRUE
    }
  }

  org_mut <- matrix(org_mut, ncol = ncol(org_bin_matr@cells), nrow = nrow(org_bin_matr@cells))
  org_mut <- organism(cells = org_mut, shift = org_bin_matr@shift)
  return(org_mut)
}

#Mutation(glider, md = c("constnt"), 0.5)
