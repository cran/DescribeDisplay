\name{dd_load}
\alias{dd_load}
\title{Load describe display}
\author{Hadley Wickham <h.wickham@gmail.com>}

\description{
Retrieve output of from describe display plugin
}
\usage{dd_load(path)}
\arguments{
\item{path}{file path}
}
\value{object of class dd}
\details{Also performs some conversion of data structures to more
conveient form so that other functions do not have to repeatedly
recompute.  Some of these conversions could probably be moved into
the Describe Display plugin, but it may be easier to just do them
on the R side..}

\examples{}
\keyword{manip}
