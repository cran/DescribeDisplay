\name{ggplot.histogram}
\alias{ggplot.histogram}
\title{Create a nice plot for Histograms...}
\usage{ggplot.histogram(data, spine=FALSE, ...)}
\description{Create a nice plot for Histograms
Create a nice looking plot complete with axes using ggplot.}
\author{Barret Schloerke \email{bigbear@iastate.edu}}
\keyword{hplot}
\arguments{\item{data}{plot to display, object created by \code{dd_load()}}
\item{spine}{(not implemented currently) whether to display the barchart as a spine plot}
\item{...}{arguments passed through to the ggplot function}}
\examples{print(ggplot(dd_example("barchart")))}
