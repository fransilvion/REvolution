#' rle2mat
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
require(Matrix)
rle2mat <- function(file_path) {
  # Read coordinates and pattern

  # Read each line of .rle file
  pattern = scan(file = file_path, what = character())
  # Get start position of organism
  pos = strsplit(pattern[2],"=")[[1]][2]
  # Get dimensions of the organism
  len_x = as.numeric(strsplit(pattern[5],",")[[1]][1])
  len_y = as.numeric(strsplit(pattern[8],",")[[1]][1])
  # Get coordinates of live cells
  #cells = strsplit(pattern[12:length(pattern)], split = "\\$", perl = T)
  cells = paste(pattern[12:length(pattern)], collapse = "")
  cell_lines = unlist(strsplit(cells, "\\$"))
  # Construct matrix for organism
  organism_l = Matrix(F, nrow = len_y, ncol = len_x, sparse = T)
  i=1
  for (cells in cell_lines)
    {
        if((substr(cells, 1,1) == "o")||(substr(cells, 1,1) == "b"))
        {
          tmp_cell = paste("1",cells, sep = "")
        }else{tmp_cell = cells}
        if(substr(tmp_cell, 2,2) == "o")
        {
          cell_start = T
        } else {cell_start = F}
        tmp_cell = gsub("bo", replacement = "b1o", tmp_cell)
        tmp_cell = gsub("ob", replacement = "o1b", tmp_cell)
        tmp_cell = gsub("!", replacement = "", tmp_cell)
        z$lengths <- as.numeric(unlist(strsplit(gsub("[o/b/!]", " ", tmp_cell[[1]][1]), " ")))
        z$lengths <- z$lengths[!is.na(z$lengths)]
        z$values <- rep(c(cell_start,!cell_start), times = ceiling(length(z$lengths)/2))[1:length(z$lengths)]
        z
        cells_occ = inverse.rle(z)
        organism_l[i,1:length(cells_occ)] = cells_occ
        if(substr(tmp_cell,nchar(tmp_cell), nchar(tmp_cell))!="o")
          {
            empty_row = as.numeric(substr(tmp_cell,nchar(tmp_cell), nchar(tmp_cell)))
            i = i+empty_row
          } else {empty_row = 0;i=i+1 }
  }
  return(organism_l)
}
file_path  = "./pattern.rle"
file_path = "./origin.rle"
rle2mat(file_path = file_path)
