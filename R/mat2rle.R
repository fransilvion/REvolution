#' mat2rle
#'
#' function that writes the organism cell matrix with golly pattern into rle file
#'
#' Accepts an object of class matrix and file name
#' and saves the matrix in the rle file format (with the given gile name)
#'
#' @param organism object of class organism
#' @param fileName name of the new file with the pattern
#'
#' @return None. Saves the organism matrix into file
#'
#' @examples
#'
#' # Save glider organism object into rle file named CoolOrganism.rle
#'
#' glider_logical <- matrix( data = c(F,T,F,
#' F,F,T,
#' T,T,T), nrow = 3, byrow = T)
#'
#' glider <- organism(cells = glider_logical)
#'
#' mat2rle(glider, "CoolOrganism.rle")
#'
#' @export
mat2rle <- function(organism, fileName){
  mat <- organism@cells
  mat <- mat*1
  x = ncol(mat)
  y = nrow(mat)

  mat[mat == 0] <- "b"
  mat[mat == 1] <- "o"

  #you get row representation in rle style
  mat <- apply(mat, 1, function(x){
    rle_res <- rle(x)
    first <- unlist(rle_res["lengths"])
    second <- unlist(rle_res["values"])
    line <- paste(paste0(first, second), collapse="")
    line <- paste0(line, "$", collapse="")
    return(line)
  })

  #concatencate them and put as the last element !
  mat <- paste0(mat, collapse="")
  res <- gsub('.{1}$', '!', mat)

  #first_line <- "#CXRLE Pos=0,0"
  first_line <- sprintf("#CXRLE Pos=%s,%s", organism@shift[1], organism@shift[2])
  second_line <- sprintf("x = %s, y = %s, rule = B3/S23", x, y)
  third_line <- res

  all_lines <- c(first_line, second_line, third_line)

  #Writing to a file
  fileConn<-file(fileName)
  writeLines(all_lines, fileConn)
  close(fileConn)
}
