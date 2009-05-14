#' Create a nice plot
#' Create a nice looking plot complete with axes using ggplot.
#' 
#' @param data plot to display, object created by \code{dd_load()}
#' @param axis.location grob function to use for drawing
#' @param ... arguments passed to the grob function
#' @author Hadley Wickham \email{h.wickham@@gmail.com}
#' @keywords hplot
#' @examples
#' 
#' print(ggplot(dd_example("tour2d")))
#' print(ggplot(dd_example("tour1d")))
#' print(ggplot(dd_example("tour2d-cube3")))
#' print(ggplot(dd_example("dot")))
#' print(ggplot(dd_example("dot-labels")))
#' print(ggplot(dd_example("xyplot")))
#' print(ggplot(dd_example("xyplot")) + opts(aspect.ratio = 1))
#' print(ggplot(dd_example("xyplot")) + xlab(NULL) + ylab(NULL))
#' print(ggplot(dd_example("ash")))
#' print(ggplot(dd_example("ash")) + geom_segment(aes(x=x,xend=x,y=0,yend=y),size=0.3))
ggplot.ddplot <- function(data, axis.location = c(0.2, 0.2), ...) {
  #cat("\nggplot.ddplot\n")
#print(head(data$points))
  p <- ggplot(data$points, 
    aes_string(x = "x", y = "y", shape = "pch", size = "cex * 6", colour = "col")) +
    scale_colour_identity() + 
    scale_size_identity() + 
    scale_shape_identity() + 
    scale_linetype_identity() +
    scale_x_continuous(
      if(TRUE %in% (c("2dtour", "1dtour") %in% class(data) ) )
        name = ""
      else if(TRUE %in% (c("1dplot") %in% class(data) ) )
        name = data$params$label 
      else 
        name = data$params$xlab,
      limits = data$xscale) + 
    scale_y_continuous(
      if(TRUE %in% (c("2dtour", "1dtour","1dplot") %in% class(data) ) )
        name = "" 
      else
        name = data$params$ylab,
      limits = data$yscale) + 
    geom_point() 

  if("1dplot" %in% class(data))
    p <- p + opts(axis.text.y = theme_blank() )
  
  axes <- dd_tour_axes(data)
  if (!is.null(axes)) {
    #Only is performed if it has tour data
    vars <- names(axes)
    names(vars) <- vars
    
    ## Following three lines are to remove errors.
    axes$pch <- rep(1,length(axes$x))
    axes$cex <- rep(2/5,length(axes$x))
    axes$colour <- rep("black",length(axes$x))
    
#    print(axes)
#	print(str(axes))

    p <- p + 
      geom_axis(data = axes, location = axis.location) +
      opts(axis.text.x = theme_blank(), axis.text.y = theme_blank(), 
        aspect.ratio = 1)
  }

  edges <- data$edges
  if (!is.null(edges)) {
    p <- p + geom_segment(
      aes_string(x = "src.x", y = "src.y", xend = "dest.x", yend = "dest.y",
      linetype = "lty", shape = "NULL", size = "lwd"), data = edges
    )
  }

  
  if (!is.null(data$labels)) {
    ## Following three lines are to remove errors.
    data$labels$pch <- rep(1,length(data$labels$x))
    data$labels$cex <- rep(2/5,length(data$labels$x))
    data$labels$colour <- rep("black",length(data$labels$x))
    p <- p + geom_text(data=data$labels, aes_string(x = "x", y = "y", label = "label"),  justification=c(data$labels$left[1], data$labels$top[1]))
  }  

  p
}


#' Create a nice plot
#' Create a nice looking plot complete with axes using ggplot.
#' 
#' @param data plot to display, object created by \code{dd_load()}
#' @param ... not used
#' @author Hadley Wickham \email{h.wickham@@gmail.com}
#' @keywords hplot
#' @examples
#' print(example(ggplot.ddplot))
#' print(example(ggplot.histogram))
#' print(example(ggplot.barplot))
ggplot.dd <- function(data, ...) { 
#  cat("\nggplot.dd\n")
  panel <- data$plots[[1]]
  ggplot(panel, ...) + opts(title = data$title)
}