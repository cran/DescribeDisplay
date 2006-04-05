# Null default
# Convienece function for setting defaults for null values
# 
# @arguments value  
# @arguments default to use if value is null
# @keyword internal 
nulldefault <- function(x, default) {
  if (is.null(x)) return(default)
  x
}