\name{ggplot.scatmat}
\alias{ggplot.scatmat}
\title{Create a nice plots in a scatter plot matrix...}
\usage{ggplot.scatmat(data, ...)}
\description{Create a nice plots in a scatter plot matrix
Create a nice looking plots in a matrix.  The 1d sections along
the diagonal have a smooth density while the values are compared 
to eachother within the matrix.}
\author{Barret Schloerke \email{bigbear@iastate.edu}}
\keyword{hplot}
\arguments{\item{data}{to display}
\item{...}{(currently) unused arguments}}
\examples{print(ggplot(dd_example("scattermat-small")))
print(ggplot(dd_example("scattermat")) + opts(aspect.ratio=1))}
