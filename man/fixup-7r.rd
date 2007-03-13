\name{fixup}
\alias{fixup}
\title{Fix DescribeDisplay files with extra commas}
\author{Hadley Wickham <h.wickham@gmail.com>}

\description{
R2.4 introduces a warning for trailing commas in lists.  This function will fix old files to remove these extra commas.  The latest version of the DescribeDisplay plugin does not produce extra commas.
}
\usage{fixup(path)}
\arguments{
\item{path}{path of file to fix}
}

\details{}

\examples{#sapply(dir("examples", ".[rR]$", full=T), fixup)}
\keyword{manip}
