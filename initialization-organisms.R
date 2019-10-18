#rows - rows of the matrix
#columns - columns of the matrix
#density - probability of ones (has to be between 0 and 1)
initialization.organisms <- function(rows, columns, density) {

  organism <- matrix(sample(0:1,rows*columns, replace=TRUE, prob=c(1-density, density)), rows, columns)
  organism <- organism > 0
  return(organism)
}
