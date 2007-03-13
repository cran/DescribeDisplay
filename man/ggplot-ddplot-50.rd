\name{ggplot.ddplot}
\alias{ggplot.ddplot}
\alias{ggplot.dd}
\title{Create a nice plot}
\author{Hadley Wickham <h.wickham@gmail.com>}

\description{
Create a nice looking plot complete with axes using ggplot.
}
\usage{ggplot.ddplot(data, plot=ggpoint, ...)}
\arguments{
\item{data}{plot to display}
\item{plot}{grob function to use for drawing}
\item{...}{other arguments passed to the grob function}
}

\details{}

\examples{xy <- dd_load(system.file("examples", "test-xyplot.r", package="DescribeDisplay"))
ggplot(xy$plots[[1]])}
\keyword{hplot}
