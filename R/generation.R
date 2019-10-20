#' generation
#'
#' function that runs one iteration of the genetic algorithm
#'
#' @param  new_gen_folder - folder where to save the new organisms
#' @param  prev_gen_folder - folder with organisms from the previous generation
#' @param  iternumber - number of the generation
#' @param  selecPor - ratio of organisms to select after fitness evaluation
#' @param  bgolly_iter - number of bgolly iterations to run
#' @param  mutRate - mutation rate
#' @param  fitnessFun - fitness function to use
#'
#' @return mutated population and saves it in the files, fitness vecotr for all previous populations
#'
#' @examples
#'
#' popG0 <- generateGenerationFirst(c(100,100), 0.5, 100, "~/Desktop/test_bgolly/G0")
#'
#' fitness <- list()
#' for (i in 1:30){
#' prev_folder <- paste("~/Desktop/test_bgolly/G", i-1, sep="")
#' res <- generation(old_population=popG0, new_gen_folder="~/Desktop/test_bgolly/G",
#' prev_gen_folder=prev_folder, iternumber=i, selecPor = 0.1, bgolly_iter=1000)
#' popG0 <- res[[1]]
#' fitness[[i]] <- unlist(res[[2]])
#' }
#'
#' @export

generation <- function(new_gen_folder="G", prev_gen_folder, iternumber=1, selecPor = 0.1, bgolly_iter=1000,
                       mutRate = 0.005, fitnessFun="sum"){

  #CREATE A FOLDER FOR NEW GENERATION
  dir.create(paste(new_gen_folder, iternumber, sep=""))
  prev_files <- list.files(prev_gen_folder)

  #RUN BGOLLY
  #AND
  #READ THE FILES WITH NEW GEN IN POPULATION
  old_pop <- c()
  new_pop <- c()
  for (i in 1:length(prev_files)){

    outputfile <- paste(new_gen_folder, iternumber, sprintf("/G%s_org_%s.xrle", iternumber, i), sep="")
    #inputfile <- paste(prev_gen_folder, "/", prev_files[i], sep="")
    inputfile <- paste(prev_gen_folder, sprintf("/G%s_org_%s.xrle", iternumber-1, i), sep="")

    system(sprintf("bgolly/bgolly -m %s -o %s %s",
                   bgolly_iter,
                   outputfile, #OUTPUT
                   inputfile)) #INPUT

    old_pop <- c(old_pop, rle2mat(inputfile))
    new_pop <- c(new_pop, rle2mat(outputfile)) #RLE ACCEPTS ONLY EXTENDED RLE
    system(sprintf("rm %s", outputfile)) #delete the output file (it was intermediate)
  }
  print("DONE BGOLLY")

  #GET GEN OLD POPULATION
  old_pop <- population( organisms = as.list(old_pop), fitness = rep(NA, length(new_pop)) )

  #GET GEN NEW POPULATION
  new_pop <- population( organisms = as.list(new_pop), fitness = rep(NA, length(new_pop)) )

  #EVALUATION
  fitness <- popFitness(new_pop, fun = fitnessFun)
  old_pop@fitness <- fitness
  max_indx <- which.max(fitness)

  #SELECTION
  res <- Selection(old_pop, selecPor, max_indx)
  Gnex <- res[[1]]
  new_max_indx <- res[[2]]

  #MUTATION
  #Gmut <- popMutation(Gnext, md = c("constant"), mutRate)
  Gmut <- popMutationNotBest(Gnext, md = c("constant"), mutRate, new_max_indx)

  #WRITING
  for (i in 1:length(Gmut@organisms)){

    outputfile <- paste(new_gen_folder, iternumber, sprintf("/G%s_org_%s.xrle", iternumber, i), sep="")
    #mat2rle(Gmut@organisms[[i]], fileName = outputfile)
    mat2rle_2(Gmut@organisms[[i]], fileName = outputfile)

  }

  #return mutated population
  return(c(Gmut, list(fitness)))

}
