GeomAxis <- proto(ggplot2:::Geom, {
  draw <- function(., data, scales, coordinates, location = c(0.2, 0.2), size=0.9, colour = "black", axis, ...) {
    axesVp <- axesViewport(axis, location)
    axes <- axesGrob(axis, gp=gpar(col = colour))
    
    gTree(
      children = gList(axes), 
      childrenvp = axesVp
    )    
  }

  objname <- "axis"
  desc <- "Projection axes"
  
  default_stat <- function(.) StatIdentity
  required_aes <- c()
  default_aes <- function(.) aes()
  
})

#' Geom Axis.
#'
#' A special ggplot2 geom for drawing the tour axes
#' 
#' @param ... should include data, location, aes\_string information
#' @author Hadley Wickham \email{h.wickham@@gmail.com}
#' @keywords internal
#' @export
#' @examples
#' library(ggplot2)
#' print(ggplot(dd_example("tour2d")))
geom_axis <- function(axis, location, ...) {
  GeomAxis$new(
    geom_params = list(axis = axis, location = location),
    inherit.aes = FALSE
  )
}