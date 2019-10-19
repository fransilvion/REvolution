#' mat2rle
#'
#' pattern reading function
#' read a .rle pattern file and convert it to I x J matrix
#'
#' Accepts a .rle pattern file
#' and returns a `organism` object
#'
#' @param file_path full path of pattern file along with the name
#'
#' @return An organism-class object
#'
#' @examples
#'
#' # Create a 9x9 matrix with 50% "on" density
#' rle2mat(file_path)
#'
#' @export
mat2rle <- function(mat, fileName){
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

  first_line <- "#CXRLE Pos=0,0"
  second_line <- sprintf("x = %s, y = %s, rule = B3/S23", x, y)
  third_line <- res

  all_lines <- c(first_line, second_line, third_line)

  #Writing to a file
  fileConn<-file(fileName)
  writeLines(all_lines, fileConn)
  close(fileConn)

}

test <- matrix(c(0,0,1,0,0,0,1,0,1,1,1,0), nrow = 4, ncol = 3, byrow=T)
test[test == 0] <- "b"
test[test == 1] <- "o"

mat <- apply(test, 1, function(x){
  rle_res <- rle(x)
  first <- unlist(rle_res["lengths"])
  second <- unlist(rle_res["values"])
  line <- paste(paste0(first, second), collapse="")
  line <- paste0(line, "$", collapse="")
  return(line)
})

x <- paste0(mat, collapse="")
res <- gsub('.{1}$', '!', x)

test[test == 0] <- "b"
test[test == 1] <- "o"
rle_res <- rle(test[3,])
first <- unlist(rle_res["lengths"])
second <- unlist(rle_res["values"])
line <- paste(paste0(first, second), collapse="")
line <- paste0(line, "$", collapse="")

rle(test[1,])

#sprintf("x = %s, y = %s, rule = B3/S23", x, y)
