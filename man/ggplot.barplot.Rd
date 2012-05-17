\name{ggplot.barplot}
\alias{ggplot.barplot}
\title{Create a nice plot for Bar Plots
Create a nice looking plot complete with axes using ggplot.}
\usage{
  ggplot.barplot(data, spine = FALSE, ...)
}
\arguments{
  \item{data}{plot to display, object created by
  \code{dd_load()}}

  \item{spine}{(not implemented currently) whether to
  display the barchart as a spine plot}

  \item{...}{arguments passed through to the ggplot
  function}
}
\description{
  Create a nice plot for Bar Plots Create a nice looking
  plot complete with axes using ggplot.
}
\examples{
library(ggplot2)
print(ggplot(dd_example("barchart-species")))
}
\author{
  Barret Schloerke \email{bigbear@iastate.edu}
}
\keyword{hplot}

