% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Generate_tree.R
\name{Generate_tree}
\alias{Generate_tree}
\title{Generate_tree}
\usage{
Generate_tree(inANS, warnings = TRUE)
}
\arguments{
\item{warnings}{Boolean for warning gneration (Default = TRUE)}

\item{ancestry}{An ancestey object for the population}
}
\value{
A phylogentic tree object for plotting
}
\description{
Given an ancestey object generate a phylogenetic tree
#Requires ape
}
\examples{
Tree <- Generate_tree(Ancestry)
plot(Tree)


}
