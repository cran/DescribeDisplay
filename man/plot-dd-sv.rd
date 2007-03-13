\name{plot.dd}
\alias{plot.dd}
\title{Draw dd plot}
\author{Hadley Wickham <h.wickham@gmail.com>}

\description{
Draw a complete describe display.
}
\usage{plot.dd(x, ..., draw = TRUE, axislocation = c(0.1, 0.1), size=0.9, axisgp=gpar(col="black"), background.color="grey90")}
\arguments{
\item{x}{dd object to plot}
\item{...}{(unused)}
\item{draw}{draw plot, or just return grob}
\item{axislocation}{location of axes (as x and y position in npc coordinates, ie. between 0 and 1)}
\item{size}{size of plot as a proportion of the total display area (set to 1 for printed out)}
\item{axisgp}{}
\item{background.color}{}
}
\value{frame grob containing all panels, note that this does not contain the title or border}
\details{If you want to layout multiple dd plots on the same page, you can
use \code{\link[grid]{grid.layout}}.  If you need even more control,
set \code{draw = FALSE} and then \code{\link[grid]{grid.draw}} the
resulting grob yourself.

This function reads a number of options directly out of the
descripedisplay datastructure.  See the examples for ways to use
these.}

\examples{ash <- dd_load(system.file("examples", "test-ash.r", package="DescribeDisplay"))
plot(ash)
ash$plots[[1]]$drawlines <- TRUE
plot(ash)
ash$plots[[1]]$showPoints <- FALSE
plot(ash)

texture <- dd_load(system.file("examples", "1d-texture.r", package="DescribeDisplay"))
plot(texture)
texture$plots[[1]]$yscale <- expand_range(texture$plots[[1]]$yscale, 0.5)
plot(texture)}
\keyword{internal}
