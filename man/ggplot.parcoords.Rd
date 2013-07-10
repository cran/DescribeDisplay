\name{ggplot.parcoords}
\alias{ggplot.parcoords}
\title{Create a nice plot for parallel coordinates plot
Create a nice looking plot complete with axes using ggplot.}
\usage{
ggplot.parcoords(data, absoluteX = FALSE, absoluteY = FALSE, edges = TRUE, ...)
}
\arguments{
  \item{data}{plot to display}

  \item{absoluteX}{make the sections proportional
  horizontally to eachother}

  \item{absoluteY}{make the sections proportional
  vertically to eachother}

  \item{edges}{boolean value to print edges.  Defaults to
  TRUE.}

  \item{...}{arguments passed to the grob function}
}
\description{
  Create a nice plot for parallel coordinates plot Create a
  nice looking plot complete with axes using ggplot.
}
\examples{
library(ggplot2)
print(ggplot(dd_example("parcoord")))
}
\author{
  Barret Schloerke \email{bigbear@iastate.edu}
}
\keyword{hplot}
