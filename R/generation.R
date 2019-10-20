#' generation
#'
#' function that runs one iteration of the genetic algorithm
#'
#' @param  population - object of a class population
#' @param  new_gen_folder - folder where to save the new organisms
#' @param  prev_gen_folder - folder with organisms from the previous generation
#' @param  iternumber - number of the generation
#' @param  selecPor - ratio of organisms to select after fitness evaluation
#'
#' @return mutated population and saves it in the files
#'
#' @examples
#'
#' @export

popG0 <- generateGenerationFirst(c(10,10), 0.5, 10, "~/Desktop/test_bgolly/G0")

generation <- function(population, new_gen_folder="G", prev_gen_folder, iternumber=1, selecPor = 0.1){

  #CREATE A FOLDER FOR NEW GENERATION
  dir.create(paste(new_gen_folder, iternumber, sep=""))
  prev_files <- list.files(prev_gen_folder)

  #RUN BGOLLY
  #AND
  #READ THE FILES WITH NEW GEN IN POPULATION
  new_pop <- c()
  for (i in 1:length(prev_files)){

    outputfile <- paste(new_gen_folder, iternumber, sprintf("/G%s_org_%s.rle", iternumber, i), sep="")
    inputfile <- paste(prev_gen_folder, "/", prev_files[i], sep="")

    system(sprintf("bgolly/bgolly -m 1000 -o %s %s",
                   outputfile, #OUTPUT
                   inputfile)) #INPUT

    new_pop <- c(new_pop, rle2mat(outputfile)) #RLE ACCEPTS ONLY EXTENDED RLE
    system(sprintf("rm %s", outputfile)) #delete the output file (it was intermediate)
  }
  print("DONE BGOLLY")

  #GET GEN NEW POPULATION
  new_pop <- population( organisms = as.list(new_pop), fitness = rep(NA, length(new_pop)) )

  #EVALUATION
  fitness <- popFitness(new_pop)
  new_pop@fitness <- fitness

  #SELECTION
  Gnext <- Selection(new_pop, selecPor)

  #MUTATION
  Gmut <- popMutation(Gnext, md = c("constant"), 0.5)

  #WRITING
  for (i in 1:length(Gmut@organisms)){

    outputfile <- paste(new_gen_folder, iternumber, sprintf("/G%s_org%s.xrle", iternumber, i), sep="")
    mat2rle(Gmut@organisms[[i]], fileName = sprintf("~/Desktop/test_bgolly/G1_org_%s.xlre", i))

  }

  #return mutated population
  return(Gmut)

}
