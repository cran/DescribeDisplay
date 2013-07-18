#' Compact scatmat data
#' A scatter plot matrix is made from the information from the 1Dplots. This function collects only that data.
#' 
#' @param data
#' @author Barret Schloerke \email{bigbear@@iastate.edu}
#' @keywords internal 
#' @importFrom reshape2 dcast
compact_scatmat <- function(data) {
  
  df <- do.call(rbind, lapply(data$plots, function(p){
    if("1dplot" %in% class(p)){
        aes <- p$points[, c("col", "pch", "cex")]
        data.frame(
          aes, 
          value = p$points$x, 
          variable = p$params$label, 
          id = 1:nrow(p$points)
        )
    }
  }))
  
  dcast(df, id + ... ~ variable)
}

#' Create a nice plots in a scatter plot matrix
#' Create a nice looking plots in a matrix.  The 1d sections along
#' the diagonal have a smooth density while the values are compared 
#' to eachother within the matrix.
#' 
#' @param data to display
#' @param ... (currently) unused arguments
#' @S3method ggplot scatmat 
#' @examples
#' library(ggplot2)
#' library(GGally)
#' print(ggplot(dd_example("scatmat")))
#' print(ggplot(dd_example("scatmat")) + theme(aspect.ratio=1))
#' @author Barret Schloerke \email{bigbear@@iastate.edu}
#' @keywords hplot 
ggplot.scatmat <- function(data,...){
  #cat("\nggplot.scatmat\n")
  df <- compact_scatmat(data)

#  p <- plotmatrix( df[,setdiff(names(df), c("cex","pch","col", "id")) ] ) +
#      scale_colour_identity() + 
#      scale_size_identity() + 
#      scale_shape_identity() + 
#      scale_linetype_identity() + 
#      theme(title = element_text(data$title)) +
#      scale_y_continuous("") +
#      scale_x_continuous("")
  df$pch <- factor(df$pch)
  p <- GGally::ggpairs(df, columns=5:ncol(df), colour="col", shape="pch", size="cex")   
  
  p
}
