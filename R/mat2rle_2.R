#' mat2rle
#'
#' pattern writing function
#' convert a binary I x J matrix to a .rle file readable by golly
#'
#' Accepts a binary matrix
#' and writes a organism.rle file as output
#'
#' @param organism_l an organism object
#'
#' @return NULL
#'
#' @examples
#'
#' mat2rle(organism_l)
#'
#' @export
mat2rle_2 <- function(organism_l, fileName) {
    organism_l <- organism_l@cells
    pattern_matrix = organism_l
    shift_l <- c( -nrow(organism_l)%/%2, -ncol(organism_l)%/%2)
    #pattern_matrix = organism_l
    pos = paste(rev(shift_l), collapse = ",")
    row_rle = ""
    for (r in seq(1,nrow(pattern_matrix)))
    #for (r in seq(1,225))
    {
        z_tmp = gsub(T, replacement = "o", pattern_matrix[r,])
        z_tmp = gsub(F, replacement = "b", z_tmp)
        z_inv = rle(z_tmp)
        k=length(z_inv$lengths)
        rle_pattern = matrix(NA, 1, 2*k)
        j=1
        for (i in seq(1,2*k,2))
        {
           rle_pattern[i] = z_inv$lengths[j]
           rle_pattern[i+1] = z_inv$values[j]
           if((i==max(seq(1,2*k,2)))&&(z_inv$values[j]=="b"))
           {
              rle_pattern[i] = "$"
              rle_pattern = rle_pattern[-(i+1)]
           }
           j=j+1
        }
        row = paste(rle_pattern, collapse = "")
        row_rle = paste0(row_rle,row)
        if(substr(row_rle,nchar(row_rle),nchar(row_rle))=="o"){row_rle = paste0(row_rle,"$")}
    }
    blanklines = rle(unlist(strsplit(row_rle, split = "")))
    k=blanklines$lengths>1
    rle_str = paste(blanklines$values, collapse = "")
    rle_str_tmp = rle_str
    j=1
    jj=1
    for (i in k)
    {
      if(i)
      {
        if(blanklines$values[jj] == "$")
        {
          insert_char = blanklines$lengths[jj]
          rle_str = paste0(substr(rle_str,1,j-1),insert_char,substr(rle_str,j,nchar(rle_str)))
          j=j+nchar(insert_char)
        }
        else{
          insert_char = paste(rep(blanklines$values[jj],blanklines$lengths[jj]-1), collapse = "")
          rle_str = paste0(substr(rle_str,1,j-1),insert_char,substr(rle_str,j,nchar(rle_str)))
          j=j+nchar(insert_char)
        }
        #print(paste(j,jj))
      }
      j=j+1
      jj=jj+1
    }
    rle_str = paste0(rle_str,"!")
    rle_str = gsub("\\$1b","$b", rle_str)
    rle_str = gsub("o1b","ob", rle_str)
    rle_str = gsub("\\$1o","$o", rle_str)
    rle_str = gsub("b1o","bo", rle_str)
    rle_str = gsub("o\\$!","o!", rle_str)
    rle_str = gsub("o1\\$","o$", rle_str)

    # Write a .rle file
    x_len = ncol(pattern_matrix)
    y_len = nrow(pattern_matrix)
    pos_str = paste0("#CXRLE Pos=", pos)
    dim_str = paste0("x = ", x_len, ", y = ", y_len,", rule = B3/S23")
    cat(pos_str,dim_str,rle_str,file=fileName,append=F, sep = "\n")
    bgolly_object = c(pos_str,dim_str,rle_str)
    return(bgolly_object)
}
#file_path = "./test.rle"
#organism_l = rle2mat(file_path = file_path)
#mat2rle(organism_l)
