#' Mutation
#'
#' organism mutation function
#' Input a binary organism matrix with selected mutation distribution selection
#'
#' Accepts a binary matrix
#' and returns a `organism` object
#'
#' @param file_path full path of pattern file along with the name
#'
#' @return An organism-class object
#'
#' @examples
#'
#'
#'
#'
#' @export


#sz = 10000
#org <- sample(c(0,1), sz^2, replace = TRUE, prob = c(0.99, 0.01)) %>% matrix(nrow = sz, ncol = sz)
# matrix(c(1,2,3,4), ncol=2) will become COL1(1,2), ROW2(3,4)

Mutation <- function(org_bin_matr, md = c("constant", "poisson"), mut_rate_avg) {
  # Create matrix to mutate
  org_mut <- as.logical(org_bin_matr@cells)

  # Get mutation rate
  if(md == "constant"){
    mut_rate = mut_rate_avg
  }
  #if(md == "gaussian") {
  #  if(is.null(mut_rate_sd)) {
  #    return("Define mut_rate_sd if Gaussian mutation distribution selected.")
  #    break}
  #  mut_rate = rnorm(1, mut_rate_avg, mut_rate_sd)
  #}
  if(md == "poisson") {
    mut_rate = rpois(1, length(org_mut)*mut_rate_avg)/length(org_mut)

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

  # Mutate the organism
#  for (i in 1:length(org_mut)) {
#    curr = org_mut[i]
#    mut = sample(c(TRUE, FALSE), 1, replace = TRUE, prob = c(mut_rate, 1-mut_rate))
#    if(mut == FALSE) {
#      next}
#    if(mut == TRUE & curr == FALSE) {
#      org_mut[i] = TRUE }
#    if(mut == TRUE & curr == TRUE) {
#      org_mut[i] = FALSE }
#  }

  org_mut <- matrix(org_mut, ncol = ncol(org_bin_matr@cells), nrow = nrow(org_bin_matr@cells))
  org_mut <- organism(cells = org_mut)
  return(org_mut)
}

#Mutation(glider, md = c("constant"), 0.5, mut_rate_sd= NULL)
