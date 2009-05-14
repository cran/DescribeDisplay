\name{dd_load}
\alias{dd_load}
\title{Load describe display...}
\usage{dd_load(path)}
\description{Load describe display
Retrieve output of from describe display plugin}
\details{Also performs some conversion of data structures to more 
conveient form so that other functions do not have to repeatedly
recompute.  Some of these conversions could probably be moved into 
the Describe Display plugin, but it may be easier to just do them
on the R side..}
\value{object of class dd}
\author{Hadley Wickham \email{h.wickham@gmail.com}}
\seealso{\code{\link{dd_example}} for an easier way of loading example
files}
\keyword{manip}
\arguments{\item{path}{file path}}
