# Add brush to plot
# This adds a rectangle to a ggplot plot indicating the brush position
# 
# @arguments plot object
# @arguments x position of brush
# @arguments y position of brush
# @arguments width of brush
# @arguments height of brush
# @arguments which corner of brush should be determined by x and y position
# @arguments fill colour for brush (use \code{\link[ggplot]{alpha}} for alpha blending)
# @arguments outline colour of brush
# @keyword hplot 
addbrush <- function(plot, x,y, width=0.5, height=0.5, just=c("left", "top"), fill=NA, col="black") {
	brush <- data.frame(x=x, y=y, width=width, height=height)
	ggrect(plot, data=brush, aes=list(x=x, y=y, width=width, height=height), justification=just, fill=fill, colour=col)
}

# Fix DescribeDisplay files with extra commas
# R2.4 introduces a warning for trailing commas in lists.  This function will fix old files to remove these extra commas.  The latest version of the DescribeDisplay plugin does not produce extra commas.
# 
# @arguments path of file to fix
# @keyword manip
#X #sapply(dir("examples", ".[rR]$", full=T), fixup)
fixup <- function(path) {
  x <- dget(path)
  dput(x, file=path)
}


# Remove hidden points
# Will remove all hidden points from the plot.
#
# @argument ddplot object
# @keyword manip
removehiddens <- function(d) {
	d$plots <- lapply(d$plots, function(dd) {
		dd$points <- dd$points[!dd$points$hidden, ]
		dd
	})
	
	d
}