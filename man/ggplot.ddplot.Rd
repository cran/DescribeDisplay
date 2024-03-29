% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggplot.R
\name{ggplot.ddplot}
\alias{ggplot.ddplot}
\title{Create a nice plot
Create a nice looking plot complete with axes using ggplot.}
\usage{
\method{ggplot}{ddplot}(data, ..., axis.location = c(0.2, 0.2))
}
\arguments{
\item{data}{plot to display, object created by \code{dd_load()}}

\item{...}{arguments passed to the grob function}

\item{axis.location}{grob function to use for drawing}
}
\description{
Create a nice plot
Create a nice looking plot complete with axes using ggplot.
}
\examples{
library(ggplot2)
print(ggplot(dd_example("xyplot")))
print(ggplot(dd_example("tour2d")))
print(ggplot(dd_example("tour1d")))
print(ggplot(dd_example("plot1d")))
print(
  ggplot(dd_example("plot1d")) +
  geom_segment(aes(x = x, xend = x, y = 0, yend = y), size = 0.3)
)
}
\author{
Hadley Wickham \email{h.wickham@gmail.com}
}
\keyword{hplot}
