\name{ggplot.timeseries}
\alias{ggplot.timeseries}
\title{Create nice plots for a time series
Create nice looking plots complete with axes using ggplot.  Produces graphics with a uniform x axis.}
\usage{
  ggplot.timeseries(data, edges = FALSE, ...)
}
\arguments{
  \item{data}{to display}

  \item{edges}{Boolean operator to tell whether to try to
  force the edges or not.  Will not work to remove the
  edges.}

  \item{...}{(currently) unused arguments}
}
\description{
  Create nice plots for a time series Create nice looking
  plots complete with axes using ggplot.  Produces graphics
  with a uniform x axis.
}
\examples{
library(ggplot2)
print(ggplot(dd_example("pigs")))
print(ggplot(dd_example("pigs"),edges=TRUE))
}
\author{
  Barret Schloerke \email{bigbear@iastate.edu}
}
\keyword{hplot}

