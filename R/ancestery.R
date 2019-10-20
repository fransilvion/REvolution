#' ancestery - class definition
#'
#' For each geneartion (G_i) in the Game of Evolution
#' The ancestery of organisms is stored as a matrix
#'
#' This is the class definition a matrix contianing this information for
#' generations 1 through n
#'
#' @param map a martix of numbers corresponding to which organisms of the previous generation each generation is related to
#'
#' @return population
#'
#' @examples
#'
#' #Each row of the map in the ancestery object must be sorted in ascending order
#' 
#' ancestery_map <- ancestery( map = rbind(c(1,2,3,4,5),c(2,4,4,5,5)) )
#'
#' @export
ancestery <- setClass(Class = "ancestery", representation(map = "matrix"))
