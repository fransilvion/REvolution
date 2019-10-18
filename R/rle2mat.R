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
library(Matrix)
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
  cells = strsplit(pattern[12:length(pattern)], split = "\\$", perl = T)
  
  # Construct matrix for organism
  organism_l = Matrix(F, nrow = len_x, ncol = len_y, sparse = T)
  blanks=0
  for (char in cells) 
  {
    #print(char)
    char_elem = strsplit(char, "o")[[1]]
    for (steps in char_elem) 
    {
      if(unlist(gregexpr("b", steps)) > 0)
      {
        blanks = strsplit(steps, "b")[[1]]
      }
      else
        blanks = 0
      print(blanks)
    }
  }
  
  # Convert the logical matrix into an organism object
  org <- organism( cells = organism_l )
  return(org)
}
file_path  = "./pattern.rle"
