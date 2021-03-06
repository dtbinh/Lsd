\name{read.4d.lsd}
\alias{read.4d.lsd}
\title{
Read all instances of LSD variables (time series) from multiple LSD results file into a 4D array
}
\description{
This function reads the data series associated to all instances of each selected variable from a set of LSD results files (.res) and saves them into a 4-dimensional array (time step x variable x instance x file).
}
\usage{
read.4d.lsd(files, col.names = NULL, nrows = -1, skip = 0,
            check.names = TRUE, pool = FALSE)
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
  \item{pool}{
logical. If TRUE, variables instances from all files are concatenated (by colums) as a single file. If FALSE (the default), each file is saved as a separated dimension (4th) in the array.
}
}
\value{
Returns a 4D array containing data series for each instance from the selected variables.
}
\author{Marcelo C. Pereira}
\note{
If the selected files don't have the same columns available (names), an error is produced.
When 'pool = TRUE', the produced array is still 4-dimensional but the fourth dimension has just one value (= 1). Pooling require that all files contains EXACTLY the same variables (number of instances may be different).
}
\seealso{
\code{\link{read.3d.lsd}},
\code{\link{read.single.lsd}},
\code{\link{read.multi.lsd}},
\code{\link{read.list.lsd}},
\code{\link{read.raw.lsd}}
}
\examples{
# Save current work directory and change to the examples directory
currWD <- getwd()
setwd(system.file("extdata", package = "LSDinterface"))

# reads all instance of all variables from three files
allArray <- read.4d.lsd(c("Sim1_1.res", "Sim1_2.res", "Sim1_3.res"))

# See parts of the 4D array in the data viewer (require package 'utils')
#View(allArray[,,1,1])   # first instance of first file (all vars and times)
#View(allArray[,9,,2])   # all instances of ninth variable in second file (all t's)
#View(allArray[50,8,,])  # all instances of all files of 8th variable for t=50

# the same, but pooling all files into a single one
allArrayPool <- read.4d.lsd(c("Sim1_1.res", "Sim1_2.res", "Sim1_3.res"), pool = TRUE)
#View(allArrayPool[,,1,1])   # first instance of first file (all vars and times)
#View(allArrayPool[,9,,1])   # all instances of ninth variable in second file (all t's)
#View(allArrayPool[50,8,,])  # all instances of all files of 8th variable for t=50

# read instances of a set of variables named '_A1p' and '_growth1'
abArray <- read.4d.lsd(c("Sim1_1.res.gz", "Sim1_2.res.gz", "Sim1_3.res.gz"), c("_A1p", "_growth1"))
#View(abArray[,,1,2])   # first instances of second file (all vars and times)
#View(abArray[,2,,3])   # all instances of second variable in third file (all t's)
#View(abArray[50,1,,])  # all instances of all files of first variable for t=50

# reads all variables/variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
allArray21_70 <- read.4d.lsd(c("Sim1_1.res", "Sim1_2.res"), skip = 20, nrows = 50)
#View(allArray21_70[,9,,2])   # all instances of ninth variable in second file
#View(allArray21_70[30,8,,])  # all instances of all files of 8th variable for t=50

# Restore working directory
setwd(currWD)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
