\name{ggplot.parcoords}
\alias{ggplot.parcoords}
\title{Create a nice plot for parallel coordinates plot...}
\usage{ggplot.parcoords(data, absoluteX=FALSE, absoluteY=FALSE, edges=TRUE, ...)}
\description{Create a nice plot for parallel coordinates plot
Create a nice looking plot complete with axes using ggplot.}
\author{Barret Schloerke \email{bigbear@iastate.edu}}
\keyword{hplot}
\arguments{\item{data}{plot to display}
\item{absoluteX}{make the sections proportional horizontally to eachother}
\item{absoluteY}{make the sections proportional vertically to eachother}
\item{edges}{boolean value to print edges.  Defaults to TRUE.}
\item{...}{arguments passed to the grob function}}
\examples{print(ggplot(dd_example("pcp")))
print(ggplot(dd_example("pcp-ash")))
print(ggplot(dd_example("pcp-ash"), edges = FALSE))
print(ggplot(dd_example("pcp-ash"),absoluteY = TRUE, edges = FALSE))
print(ggplot(dd_example("pcp-texture")))
print(ggplot(dd_example("pcp-texture"), edges =FALSE))
print(ggplot(dd_example("pcp-texture"),absoluteY=TRUE, edges =FALSE))}
