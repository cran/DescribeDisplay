library(DescribeDisplay)
sapply(dir("~/ggobi/DescribeDisplay/R", "\\.r$",full=TRUE), source)

#if (!exists("tests")) {
#  paths <- dir("inst/examples", "\\.[rR]$", full=T)
#  tests <- lapply(paths, dd_load)
#  names(tests) <- sub("\.[rR]$", "", dir("tests/", "\\.[rR]$"))  
#}
