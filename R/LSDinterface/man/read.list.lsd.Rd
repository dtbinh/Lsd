\name{read.list.lsd}
\alias{read.list.lsd}
\title{
Read one or all instances of LSD variables (time series) from a LSD results file into a list
}
\description{
This function reads the data series associated to a specific or all instances of each selected variable from a LSD results file (.res) and saves them into separated matrices (one per variable).
}
\usage{
read.list.lsd(files, col.names = NULL, nrows = -1, skip = 0,
              check.names = TRUE, instance = 0, pool = FALSE)
}
\arguments{
  \item{files}{
a character vector containing the names of the LSD results files which the data are to be read from. If they do not contain an absolute path, the file names are relative to the current working directory, getwd(). These can be compressed files and must include the appropriated extension (usually .res or .res.gz).
}
  \item{col.names}{
a vector of optional names for the variables. The default is to read all variables.
}
  \item{nrows}{
integer: the maximum number of time steps (rows) to read in. Negative and other invalid values are ignored. The default is to read all rows.
}
  \item{skip}{
integer: the number of time steps (rows) of the results file to skip before beginning to read data. The default is to read from the first time step (t = 1).
}
  \item{check.names}{
logical. If TRUE then the names of the variables are checked to ensure that they are syntactically valid variable names. If necessary they are adjusted (by make.names) so that they are, and also to ensure that there are no duplicates.
}
  \item{instance}{
integer: the instance of the variable to be read, for variables that exist in more than one object. This number is based on the position (column) of the variable in the results file. The default (0) is to read all instances.
}
  \item{pool}{
logical. If TRUE, variables instances from all files are concatenated (by colums) into a single matrix. If FALSE (the default), each file is saved as a separated matrix.
}
}
\value{
Returns a list containing matrices with the selected variables' time series in the results file. If 'pool = TRUE', the list contains a single, consolidated matrix (column names are not unique).
}
\author{Marcelo C. Pereira}
\note{
When using the option 'pool = TRUE', columns from multiple files are consolidated with their original names, so names will not be unique anymore. You may use \code{\link{unique}} to change column names so they become unique, if required.
The returned matrices may be potentially very wide, in particular if variables are not well selected(see col.names above) or if there is a large number of instances.
}
\seealso{
\code{\link{read.single.lsd}},
\code{\link{read.multi.lsd}},
\code{\link{read.3d.lsd}},
\code{\link{read.4d.lsd}},
\code{\link{read.raw.lsd}},
\code{\link{unique}}
}
\examples{
# Save current work directory and change to the examples directory
currWD <- getwd()
setwd(system.file("extdata", package = "LSDinterface"))

# reads all instances of all variables from three files (one matrix each)
tableList <- read.list.lsd(c("Sim1_1.res", "Sim1_2.res", "Sim1_3.res"))

# See parts of the 3D array in the data viewer (require package 'utils')
#View(tableList[[ 1 ]])
#View(tableList[[ 2 ]])
#View(tableList[[ 3 ]])

# read all instances of a set of variables named '_A1p' and '_growth1'
# and pool data
abTable <- read.list.lsd(c("Sim1_1.res.gz", "Sim1_2.res.gz"), c("_A1p", "_growth1"), pool = TRUE)
#View(abTable)

# reads instance 4 of all variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
inst4List21_70 <- read.list.lsd(c("Sim1_1.res", "Sim1_2.res"), skip = 20, nrows = 50, instance = 4)
#View(inst4List21_70[[ 1 ]])
#View(inst4List21_70[[ 2 ]])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
