# Load describe display
# Retrieve output of from describe display plugin
# 
# Also performs some conversion of data structures to more 
# conveient form so that other functions do not have to repeatedly
# recompute.  Some of these conversions could probably be moved into 
# the Describe Display plugin, but it may be easier to just do them
# on the R side..
# 
# @arguments file path
# @value object of class dd
# @keyword  manip
# a <- dd_load(system.file("examples", "test-edges.r"))
# b <- dd_load(system.file("examples", "test-dot.r"))
dd_load <- function(path) {
  dd <- source(path)$value
  class(dd) <- c("dd", dd_plot_class(dd$type))
  dd$colormap$foreground <- sapply(dd$colormap$foregroundColors, 
    function(x) do.call(rgb, as.list(x))
  )
  dd$colormap$foregroundColors <- NULL
  cols <- nulldefault(dd$ncols, 1)
  dd$dim <- c(dd$nplots / cols, cols)
  dd$plots <- lapply(1:dd$nplots, function(n) dd_clean_plot(dd, n))  
  
  dd
}

# Clean plot data structure
# Cleans up plot data structure into consistent, easy to use data structure
# 
# @arguments dd object
# @arguments plot number
# @keyword internal 
dd_clean_plot <- function(dd, n=1) {
  names(dd$plots[[n]]) <- gsub("plot", "", names(dd$plots[[n]]))
  plot <- c(
    list(
      points = dd_points(dd, n),
      edges = dd_edges(dd, n),
    ), 
    dd$plots[[n]][c("type","projection", "params")]
  )
  plot$xscale <- expand_range(range(plot$points$x), 0.1)
  plot$yscale <- expand_range(range(plot$points$y), 0.1)
  class(plot) <- c(plot$type, dd_plot_class(plot$projection), "ddplot")
  plot
}



# Describe display points data
# Retrieves the describe display points data for the given plot number.
# 
# @arguments list of values from describe display 
# @arguments plot number, defaults to first plot
# @value data frame suitable for plotting
# @keyword internal 
dd_points <- function(dd, n=1) {
  df <- as.data.frame(dd$plots[[n]]$points)
  
  # Remap point aesthetics to R appropriate values
  df$col <- dd$colormap$foreground[df$color + 1]
  df$pch <- c(18, 3, 4, 1, 0, 16, 15)[df$glyphtype + 1]
  df$cex <- (df$glyphsize + 1)/2
  rownames(df) <- df$index
  df[!df$hidden, c("x","y", "col","pch", "cex")] # Return only visible points
}

# Describe display edge data
# Retrieves the describe display edge data for the given plot number.
# 
# @arguments list of values from describe display 
# @arguments plot number, defaults to first plot
# @value data frame suitable for plotting
# @keyword internal 
dd_edges <- function(dd, n=1) {
  if (is.null(dd$plots[[n]]$edges)) return()
  df <- do.call(rbind, lapply(dd$plots[[n]]$edges, as.data.frame))
  
  # Remap edge aesthetics to appropriate values
  df$col <- dd$colormap$foreground[df$color + 1]
  df$lwd <- (df$lwd + 1)/2
  df$lty <- rep(1,6)[df$ltype + 1]
  
  df <- df[!df$hidden, c("src","dest", "col","lwd", "lty")] # Return only visible edges
  points <- dd_points(dd, n)
  src <- points[as.character(df$src), c("x","y")]
  names(src) <- c("src.x", "src.y")
  dest <- points[as.character(df$dest), c("x","y")]
  names(dest) <- c("dest.x", "dest.y")
  
  cbind(src, dest, df)
}

# Describe display plot class
# Compute valid R class name for given plot type
# 
# @arguments list of values from describe display 
# @arguments plot number, defaults to first plot
# @keyword internal 
dd_plot_class <- function(projection) {
  gsub("\\s+", "", tolower(projection))
}

# Describe display plot defaults
# Gather overall plot defaults for specified plot
# 
# @arguments list of values from describe display 
# @arguments plot number, defaults to first plot
# @keyword internal 
dd_defaults <- function(dd, n=1) {
  list(
    main = dd$title,
    xlab = nulldefault(dd$plots[[n]]$plotparams$xlab, ""),
    ylab = nulldefault(dd$plots[[n]]$plotparams$ylab, ""),
    axes = FALSE
  )  
}

# Describe display tour axis
# Return representation of axes for specified plot
# 
# @arguments list of values from describe display 
# @arguments plot number, defaults to first plot
# @keyword internal 
dd_tour_axes <- function(plot) {
  if (is.null(plot$params$F)) return()
  if (plot$projection == "1D Tour") return()
  
  proj <- matrix(plot$params$F, ncol=2, byrow=F)
  colnames(proj) <- c("x","y")
  lbls <- plot$params$labels
  
  ranges <- do.call(rbind,  plot$params$ranges)
  df <- data.frame(proj, label=lbls, range=ranges)
  
  df$r <- with(df, sqrt(x^2 + y^2))
  df$theta <- atan2(df$y, df$x)
  
  df
}

# Print dd object
# 
# @keyword internal 
print.dd <- function(x, ...) str(x)
