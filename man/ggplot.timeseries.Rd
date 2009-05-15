\name{ggplot.timeseries}
\alias{ggplot.timeseries}
\title{Create nice plots for a time series...}
\usage{ggplot.timeseries(data, edges=FALSE, ...)}
\description{Create nice plots for a time series
Create nice looking plots complete with axes using ggplot.  Produces graphics with a uniform x axis.}
\author{Barret Schloerke \email{bigbear@iastate.edu}}
\keyword{hplot}
\arguments{\item{data}{to display}
\item{edges}{Boolean operator to tell whether to try to force the edges or not.  Will not work to remove the edges.}
\item{...}{(currently) unused arguments}}
\examples{print(ggplot(dd_example("pigs")))
print(ggplot(dd_example("pigs"),edges=TRUE))}
