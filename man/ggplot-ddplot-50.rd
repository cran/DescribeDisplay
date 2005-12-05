\name{ggplot.ddplot}
\alias{ggplot.ddplot}
\title{Create a nice plot}
\author{Hadley Wickham <h.wickham@gmail.com>}

\description{
Create a nice looking plot complete with axes using ggplot.
}
\usage{ggplot.ddplot(data, ...)}
\arguments{
\item{data}{plot to display}
\item{...}{other (currently) unused arguments}
}

\details{}

\examples{xy <- dd_load(system.file("examples", "test-xyplot.r", package="DescribeDisplay"))
ggplot(xy$plots[[1]])}
\keyword{hplot}
