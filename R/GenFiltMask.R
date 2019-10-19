#'SGenFiltMask
#'
#' GenFiltMask function
#' Input size of the matrix
#'
#' Accepts four arguments - nrow, ncol, N, SD
#' and returns N `FiltMask` objects
#'
#' @param file_path full path of pattern file along with the name
#'
#' @return A FiltMask-class object
#'
#' @examples
#'
#'
#'
#'
#' @export
#'


GenFiltMask  = function(nrow, ncol, N, SD){

  library("Matrix")
  library("sparseMVN")
  library("mvtnorm")

  delta = 10^-10;

  xMat = matrix(1:nrow,nrow*ncol,1);
  yMat = as.vector(t(matrix(1:ncol,ncol,nrow)));

  xDiff = matrix(c(xMat),length(xMat),length(xMat));
  xDiff = xDiff - t(xDiff);
  yDiff = matrix(c(yMat),length(yMat),length(yMat));
  yDiff = yDiff - t(yDiff);

  CoV = 1/(SD*sqrt(2*pi))*exp(-0.5*((sqrt(xDiff^2+yDiff^2))/(SD))^2)

  FiltMask = rmvnorm(N, matrix(0,nrow*ncol,1), CoV) > 0
  return(FiltMask)
}

a = GenFiltMask(10,10,1000,5)
