% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generation.R
\name{generation}
\alias{generation}
\title{generation}
\usage{
generation(new_gen_folder = "G", prev_gen_folder, iternumber = 1,
  selecPor = 0.1, bgolly_iter = 1000, mutRate = 0.005,
  fitnessFun = "sum")
}
\arguments{
\item{new_gen_folder}{- folder where to save the new organisms}

\item{prev_gen_folder}{- folder with organisms from the previous generation}

\item{iternumber}{- number of the generation}

\item{selecPor}{- ratio of organisms to select after fitness evaluation}

\item{bgolly_iter}{- number of bgolly iterations to run}

\item{mutRate}{- mutation rate}

\item{fitnessFun}{- fitness function to use}
}
\value{
mutated population and saves it in the files, fitness vecotr for all previous populations
}
\description{
function that runs one iteration of the genetic algorithm
}
\examples{

popG0 <- generateGenerationFirst(c(100,100), 0.5, 100, "~/Desktop/test_bgolly/G0")

fitness <- list()
for (i in 1:30){
prev_folder <- paste("~/Desktop/test_bgolly/G", i-1, sep="")
res <- generation(old_population=popG0, new_gen_folder="~/Desktop/test_bgolly/G",
prev_gen_folder=prev_folder, iternumber=i, selecPor = 0.1, bgolly_iter=1000)
popG0 <- res[[1]]
fitness[[i]] <- unlist(res[[2]])
}

}
