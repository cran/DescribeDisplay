# Create a nice plot
# Create a nice looking plot complete with axes using ggplot.
# 
# @arguments plot to display
# @arguments other (currently) unused arguments
# @keyword hplot
#X xy <- dd_load(system.file("examples", "test-xyplot.r", package="DescribeDisplay"))
#X ggplot(xy$plots[[1]])
ggplot.ddplot <- function(data, ...) {
  p <- ggplot(data$points, aesthetics=list(x=x, y=y, colour=col, shape=pch, size=cex*1.5))
  p <- scmanual(p, "colour")
  p <- scmanual(p, "size")
  p <- scmanual(p, "shape")
  p <- pscontinuous(p, "x", range=data$xscale)
  p <- pscontinuous(p, "y", range=data$yscale)

  ggpoint(p)
}