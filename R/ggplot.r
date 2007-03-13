# Create a nice plot
# Create a nice looking plot complete with axes using ggplot.
# 
# @arguments plot to display
# @arguments grob function to use for drawing
# @arguments other arguments passed to the grob function
# @keyword hplot
# @alias ggplot.dd
#X xy <- dd_load(system.file("examples", "test-xyplot.r", package="DescribeDisplay"))
#X ggplot(xy$plots[[1]])
ggplot.ddplot <- function(data, plot=ggpoint, ...) {	
  p <- ggplot(data$points, aesthetics=list(x=x, y=y))
  p <- scmanual(p, "colour")
  p <- scmanual(p, "size")
  p <- scmanual(p, "shape")
  p <- pscontinuous(p, "x", range=data$xscale)
  p <- pscontinuous(p, "y", range=data$yscale)

	p$xlabel <- data$params$xlab
	p$ylabel <- data$params$ylab	


	ggopt(axis.colour = "black")
  p <- plot(p, ..., aes=list(colour=col, shape=pch, size=cex*2))

  # edges <- panel$edges
  # if (!is.null(edges))  
  #   p <- ggpath(data=edges, aes=list(x=src.x, y=src.y, dest.x, dest.y, default.units="native", gp=gpar(lwd=edges$lwd, col=edges$col))))

  if (!is.null(data$labels))
    p <- ggtext(p, data=data$labels, aes=list(label=label), justification=c(data$labels$left[1], data$labels$top[1]))
    
  p
}

ggplot.dd <- function(data, ...) { 
	panel <- data$plots[[1]]
	p <- ggplot(panel, ...)
	
	p$title <- data$title
	p$xlabel <- panel$params$xlab
	p$ylabel <- panel$params$ylab
	
	p
}

# Compact pcp data
# A parallel coordinates is written out as a series of 1D dotplots.  This function
# compacts it back into one dataset.
# 
# @arguments data
# @keyword internal 
compact_pcp <- function(data) {
	df <- do.call(rbind, lapply(data$plots, function(p) data.frame(p$points[, c("col", "pch","cex")], value=p$points$x, variable=p$params$label, id=1:nrow(p$points))))
	cast(df, id + ... ~ variable)
}

# Create a nice plot for parallel coordinates plot
# Create a nice looking plot complete with axes using ggplot.
# 
# @arguments plot to display
# @arguments other (currently) unused arguments
# @keyword hplot 
ggplot.parcoords <- function(data, ...) { 
	df <- compact_pcp(data)
	p <- ggpcp(df, vars = setdiff(names(df), c("cex","pch","col", "id")), scale="range")
	
	if (data$showPoints) {
	  p <- ggpoint(p, aesthetics=list(colour=col, shape=pch, size=cex*1.5), ...)
	}
	
	p <- ggline(p, aesthetics=list(colour=col, line_type=pch, shape=pch, size=cex*1.5), ...)

  p <- scmanual(p, "colour")
  p <- scmanual(p, "size")
  p <- scmanual(p, "line_type")
  p <- scmanual(p, "shape")
	
	p$title <- data$title
	p$xlabel <- NULL
	p$ylabel <- NULL
	
	ggopt(axis.colour = "black")
	p
}
