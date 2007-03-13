# Plot describe display output.
# This uses base graphics and is rather limited in terms of layout.
# 
# You probably shouldn't need to ever use this, but it is convenient 
# for quickly checking that the datastructures are correct.
# 
# @arguments describe display object
# @arguments plot 
# @keyword hplot 
plot.dd <- function(x, y=1, ...) {
  dd <- x; n <- 1
  arguments <- defaults(list(...), c(dd_points(dd, n), dd_defaults(dd, n)))
  
  do.call(plot, arguments)
  edges <- dd_edges(dd,n)
  if (!is.null(edges)) {
    segments(edges$src.x, edges$src.y, edges$dest.x, edges$dest.y, lwd=edges$lwd, col=edges$col) 
  }
    
  box(col="grey")
}



# Panel grob
# Construct grob for single panel.
# 
# @arguments describe display object
# @arguments plot 
# @arguments axis location, x and y position
# @keyword internal 
panelGrob <- function(panel,axislocation = c(0.1, 0.1), axis.gp = gpar(col="black"), background.color="grey90") {
  points <- panel$points
  edges <- panel$edges
  
  axesVp <- axesViewport(panel, axislocation)
  grobs <- list(
    rectGrob(gp=gpar(col="grey", fill=background.color))
	)


  if (!is.null(edges))  
    grobs <- append(grobs, list(segmentsGrob(edges$src.x, edges$src.y, edges$dest.x, edges$dest.y, default.units="native", gp=gpar(lwd=edges$lwd, col=edges$col))))
	
	if (is.null(panel$showPoints) || panel$showPoints) {
		grobs <- append(grobs, list(pointsGrob(points$x, points$y, pch=points$pch, gp=gpar(col=points$col), size=unit(points$cex, "char"))))
	}
	
	if (!is.null(panel$labels)) {
	  labels <- panel$labels
	  grobs <- append(grobs, list(
	    textGrob(as.character(labels$label), labels$x, labels$y, default.units="native",hjust=labels$left, vjust=labels$top)
	  ))
	}
	
  grobs <- append(grobs,  list(
    textGrob(nulldefault(panel$params$xlab, ""), 0.99, 0.01, just = c("right","bottom")),
    textGrob(nulldefault(panel$params$ylab, ""), 0.01, 0.99, just = c("left", "top")),
    axesGrob(panel, gp=axis.gp)
  ))

  if (length(panel$params$label) == 1)
    grobs <- append(grobs, list(textGrob(nulldefault(panel$params$label, ""), 0.5, 0.01, just = c("centre", "bottom"))))

  if (!is.null(panel$drawlines) && panel$drawlines) {
    grobs <- append(grobs, list(segmentsGrob(points$x, panel$baseline, points$x, points$y, default.units="native",  gp=gpar(col=points$col))))
  }

  
  gTree(
    children = do.call(gList, grobs), 
    vp = dataViewport(
      xscale = panel$xscale,
      yscale = panel$yscale,
      clip = "on"),
    childrenvp = axesVp
  )
}

# Plot a dd plot
# Convenient method to draw a single panel.
# 
# This is mainly used for bug testing so that you can pull out a single 
# panel quickly and easily.
# 
# @arguments object to plot
# @arguments axis location, x and y position
# @keyword hplot
plot.dd_plot <- function(x, ..., axislocation = c(0.1, 0.1), axisgp=gpar(col="black"), background.color = "grey90") {
  grid.newpage()
  grid.draw(panelGrob(x, axislocation=axislocation, axisgp=axisgp, background.color=background.color))  
}

# Draw dd plot
# Draw a complete describe display.
# 
# If you want to layout multiple dd plots on the same page, you can
# use \code{\link[grid]{grid.layout}}.  If you need even more control,
# set \code{draw = FALSE} and then \code{\link[grid]{grid.draw}} the 
# resulting grob yourself.
# 
# This function reads a number of options directly out of the 
# descripedisplay datastructure.  See the examples for ways to use
# these.
# 
# @arguments dd object to plot
# @arguments (unused)
# @arguments draw plot, or just return grob
# @arguments location of axes (as x and y position in npc coordinates, ie. between 0 and 1)
# @arguments size of plot as a proportion of the total display area (set to 1 for printed out)
# @value frame grob containing all panels, note that this does not contain the title or border
#X ash <- dd_load(system.file("examples", "test-ash.r", package="DescribeDisplay"))
#X plot(ash)
#X ash$plots[[1]]$drawlines <- TRUE
#X plot(ash)
#X ash$plots[[1]]$showPoints <- FALSE
#X plot(ash)
#X
#X texture <- dd_load(system.file("examples", "1d-texture.r", package="DescribeDisplay"))
#X plot(texture)
#X texture$plots[[1]]$yscale <- expand_range(texture$plots[[1]]$yscale, 0.5)
#X plot(texture)
# @keyword internal 
plot.dd <- function(x, ..., draw = TRUE, axislocation = c(0.1, 0.1), size=0.9, axisgp=gpar(col="black"), background.color="grey90") {
  d <- x$dim
  layout <- grid.layout(nrow = d[1], ncol = d[2])
  panels <- frameGrob(layout = layout)
  
  for(i in 1:x$nplot) {
    panels <- placeGrob(panels, 
			panelGrob(x$plots[[i]], axislocation=axislocation, axis.gp=axisgp, background.color=background.color), 
			col = (i - 1) %/% d[1] + 1, row = (i - 1) %% d[1] + 1
		)
  }

	if (!is.null(x$title) && nchar(x$title) != 0) {
	  pg <- frameGrob(grid.layout(nrow=2, ncol=1))
	  pg <- packGrob(pg, textGrob(x$title, gp=gpar(cex=1.3)), row=1, height=unit(2,"lines"))
	  pg <- packGrob(pg, panels, row=2)
	} else {
		pg <- panels
	}

  if (draw) {
    grid.newpage()
    pushViewport(viewport(w = size, h = size))
    grid.draw(pg)
  }
  
  invisible(panels)
}

# Axes grob
# Construct grob for axes.
# 
# @arguments describe display object
# @arguments plot 
# @keyword internal 
axesGrob <- function(panel, gp=gpar(col="black")) {
  axes <- dd_tour_axes(panel)
  if (is.null(axes)) return()

	if (!is.null(axes$y)) { # 2d tour 
		bigaxes <- subset(axes, r > 0.3)
		
	  gTree(children=gList(
	    circleGrob(0, 0, 1, default.units="native", gp=gpar(fill="transparent", col="black")),
	    segmentsGrob(0,0, axes$x, axes$y, default.units="native"),
	    textGrob(bigaxes$label, 1.1 * cos(bigaxes$theta), 1.1 * sin(bigaxes$theta), default.units="native")
	  ), name="axis", vp=vpPath("axes"), gp=gp)  

	} else { # 1d tour  
		n <- nrow(axes)

		gTree(children=gList(
			rectGrob(),
			linesGrob(x=unit(c(0,0), "native"), y = unit(c(0,1), "npc")),
			segmentsGrob(-1, 1:n , 1, 1:n, default="native", gp=gpar(lty=3)),
			segmentsGrob(0, 1:n , axes$x, 1:n, default="native", gp=gpar(lwd=2)),
			textGrob(-1:1, -1:1, -0.3, default="native", just=c("centre", "top"), gp=gpar(cex=0.9)),
			textGrob(axes$label, 1.1, 1:n, default="native", just=c("left", "centre"))
			
		), name="axis", vp=vpPath("axes"), gp=gp)
	}
}

# Axes viewport
# Construct viewport for axes.
# 
# @arguments describe display object
# @arguments plot 
# @keyword internal 
axesViewport <- function(panel, axislocation) {
  axes <- dd_tour_axes(panel)
  if (is.null(axes)) return()

	if (!is.null(axes$y)) { # 2d tour 
		viewport(xscale=c(-1,1), yscale=c(-1,1), name="axes", width=0.2, height=0.2, x=axislocation[1], y=axislocation[2], default.units="snpc")
	} else { # 1d tour 
		n <- nrow(axes)
		viewport(xscale=c(-1,1), yscale=c(0, n + 1), name="axes", width=0.1, height=unit(n+1, "lines"), x=axislocation[1], y=axislocation[2])
	}
}
