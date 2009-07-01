\name{ggplot.ddplot}
\alias{ggplot.ddplot}
\title{Create a nice plot...}
\usage{ggplot.ddplot(data, axis.location=c(0.2, 0.2), ...)}
\description{Create a nice plot
Create a nice looking plot complete with axes using ggplot.}
\author{Hadley Wickham \email{h.wickham@gmail.com}}
\keyword{hplot}
\arguments{\item{data}{plot to display, object created by \code{dd_load()}}
\item{axis.location}{grob function to use for drawing}
\item{...}{arguments passed to the grob function}}
\examples{print(ggplot(dd_example("tour2d")))
print(ggplot(dd_example("tour1d")))
print(ggplot(dd_example("tour2d-cube3")))
print(ggplot(dd_example("dot")))
print(ggplot(dd_example("dot-labels")))
print(ggplot(dd_example("xyplot")))
print(ggplot(dd_example("xyplot")) + opts(aspect.ratio = 1))
print(ggplot(dd_example("xyplot")) + xlab(NULL) + ylab(NULL))
print(ggplot(dd_example("ash")))
print(ggplot(dd_example("ash")) + geom_segment(aes(x=x,xend=x,y=0,yend=y),size=0.3))}
