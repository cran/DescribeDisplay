\name{plot.ddplot}
\alias{plot.ddplot}
\title{Plot a dd plot...}
\usage{plot.ddplot(x, ..., axislocation=c(0.1, 0.1),
    axis.gp=gpar(col = "black"),
    background.color=grey90)}
\description{Plot a dd plot
Convenient method to draw a single panel.}
\details{This is mainly used for bug testing so that you can pull out a single 
panel quickly and easily.}
\author{Hadley Wickham \email{h.wickham@gmail.com}}
\keyword{hplot}
\arguments{\item{x}{object to plot}
\item{...}{(not used)}
\item{axislocation}{location of axes (as x and y position in npc coordinates, ie. between 0 and 1)}
\item{axis.gp}{frame grob containing all panels, note that this does not contain the title or border}
\item{background.color}{color of in the background of the plot}}
\examples{scatmat <- dd_example("scattermat")
plot(scatmat)
plot(scatmat$plots[[1]])
plot(scatmat$plots[[3]])
plot(scatmat$plots[[4]])}
