#'Sex
#'
#' Sex function
#' Input two `organism` objects
#'
#' Accepts two parent `organism` objects
#' and returns a daughter `organism` object
#'
#' @param file_path full path of pattern file along with the name
#'
#' @return An organism-class object
#'
#' @examples
#'
#' daughter = Sex(Parent1, Parent2, 2);
#'
#'
#' @export
require("mvtnorm")
require("plot.matrix")

Sex = function(organism1, organism2, SD){

  MatIn1 = as.logical(organism1@cells)
  MatIn2 = as.logical(organism2@cells)

  sz = floor(sqrt(dim(MatIn1)));
  sz_act = dim(MatIn1);
  FiltMaskAll = matrix(FALSE,sz_act[1],sz_act[2]);

  xMat = c(matrix(1:sz[1],sz[1],sz[2]));
  yMat = c(t(matrix(1:sz[2],sz[2],sz[1])));

  xDiff = matrix(xMat,length(xMat),length(xMat)) - t(matrix(xMat,length(xMat),length(xMat)));
  yDiff = matrix(yMat,length(yMat),length(yMat)) - t(matrix(yMat,length(yMat),length(yMat)));

  CoV = 1/(SD*sqrt(2*pi))*exp(-0.5*((sqrt(xDiff^2+yDiff^2))/(SD))^2)

  FiltMask = matrix(rmvnorm(1, matrix(0,sz[1]*sz[2],1), CoV) > 0,sz[1],sz[2])

  FiltMaskAll[1:sz[1]^2,1:sz[2]^2] = kronecker(FiltMask,matrix(1,nrow=sz[1],ncol=sz[2]));

  FiltMaskAll[(sz[1]^2):sz_act[1],] = FiltMaskAll[sz[1]^2,];
  FiltMaskAll[,(sz[2]^2):sz_act[2]] = FiltMaskAll[,sz[2]^2];

  MatOut = MatIn1 * FiltMaskAll + MatIn2 * !FiltMaskAll;

  organismOut <- matrix(organismOut, ncol = ncol(organismOut@cells), nrow = nrow(organismOut@cells))
  organismOut <- organism(cells = organismOut)
  return(organismOut)

}



