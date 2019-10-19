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
generation <- function(populationFolder){
  #OFFSPRING

  mat2rle()
  #bgolly function run system('bash -c "ls /"')

  #EVALUATION
  Fitness()

  #SELECTION
  Selection()

  #MUTATION
  Mutation()

  #WRITING
  mut2rle()

}


test_guy <- god(I = 9, J = 9, density = 0.5)
mat2rle(test_guy, "~/Desktop/test_bgolly/test_guy.xrle")
system('bash -c "bgolly/bgolly -m 1000 -o ~/Desktop/test_bgolly/test_iterated.xrle ~/Desktop/test_bgolly/test_guy.xrle"')
iterated_guy <- rle2mat("~/Desktop/test_bgolly/test_iterated.xrle")
itet_pop <- population( organisms = list(iterated_guy), fitness = c(NA) )
fitness <- popFitness(itet_pop)
itet_pop@fitness <- fitness
G1 <- Selection(itet_pop, 0.01)
itet_guy <- Mutation(G1, md = c("constant"), 0.5, mut_rate_sd= NULL)

getwd()
