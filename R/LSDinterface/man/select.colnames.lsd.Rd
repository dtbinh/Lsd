\name{select.colnames.lsd}
\alias{select.colnames.lsd}
\title{
Select a subset of a LSD results matrix (by column/variable names)
}
\description{
This function select a subset of a LSD results matrix (as produced by \code{\link{read.raw.lsd}}) by the column (variable) names, considering only the name part of the column labels.
}
\usage{
select.colnames.lsd(dataSet, col.names, instance = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataSet}{
matrix produced by the invocation of \code{\link{read.raw.lsd}}, \code{\link{read.single.lsd}}, \code{\link{read.multi.lsd}} or \code{\link{read.list.lsd}} (a single matrix a time) functions.
}
  \item{col.names}{
a vector of optional names for the variables. The default is to read all variables. The names must to be in R format.
}
  \item{instance}{
integer: the instance of the variable to be read, for variables that exist in more than one object. This number is based on the position (column) of the variable in the results file. The default (0) is to read all instances.
}
}
\value{
Returns a single matrix containing the selected variables' time series contained in the original data set.
}
\author{Marcelo C. Pereira}
\note{
The variable/column names must be valid R column names (e.g., names do not start with a underscore). Use \code{\link{make.names}} if required.
}
\seealso{
\code{\link{select.colattrs.lsd}},
\code{\link{make.names}}
}
\examples{
# Save current work directory and change to the examples directory
currWD <- getwd()
setwd(system.file("extdata", package = "LSDinterface"))

# reads all instances of all variables
bigTable <- read.raw.lsd("Sim1_1.res")

# See matrix in the data viewer (require package 'utils')
#View(bigTable)

# extract all instances of a set of variables named '_A1p' and '_growth1'
abTable <- select.colnames.lsd(bigTable, make.names(c("_A1p", "_growth1")))
#View(abTable)

# Restore working directory
setwd(currWD)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
