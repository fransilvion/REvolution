#' organism - class definition
#'
#' In the Game of Evolution, an organism is an I x J binary matrix.
#' Each ON state in this matrix is a 'living cell' in Game of Life
#' Each OFF state in this matrix is a 'dead cell' in Game of Life
#'
#' To account for
#'
#' @param cells an IxJ binary matrix to be stored as an organism
#' @param shift a Vector of c(X,Y) coordinate offsets to center the cells matrix [c(0,0)]
#'
#' @return organism
#'
#' @examples
#' # Example of a glider encoded as logical matrix
#' glider_logical <- matrix( data = c(F,T,F,
#'                                    F,F,T,
#'                                    T,T,T), nrow = 3, byrow = T)
#'
#' # Example of a glider encoded as an organism
#' glider <- organism(cells = glider_logical)
#'
#' @export
organism <- setClass(Class = "organism", representation(cells = "matrix", shift = "vector" ))
#
# # Example of a glider encoded as logical matrix
# glider_logical <- matrix( data = c(F,T,F,
#                                    F,F,T,
#                                    T,T,T), nrow = 3, byrow = T)
#
# # Example of a glider encoded as an organism
#
# glider <- organism(cells = glider_logical, shift = c(-1,-1))
