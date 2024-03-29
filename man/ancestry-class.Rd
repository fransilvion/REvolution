% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ancestry.R
\docType{class}
\name{ancestry-class}
\alias{ancestry-class}
\alias{ancestry}
\title{ancestry - class definition}
\arguments{
\item{map}{a martix of numbers corresponding to which organisms of the previous generation each generation is related to}
}
\value{
population
}
\description{
For each geneartion (G_i) in the Game of Evolution
The ancestry of organisms is stored as a matrix
}
\details{
This is the class definition a matrix contianing this information for
generations 1 through n
}
\examples{

#Each row of the map in the ancestry object must be sorted in ascending order

ancestry_map <- ancestry( map = rbind(c(1,2,3,4,5),c(2,4,4,5,5)) )

}
