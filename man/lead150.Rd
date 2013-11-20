\name{lead150}
\alias{lead150}
\docType{data}
\title{
Smoking and lead in 150 matched 1-5 sets.
}
\description{
Comparison of 150 daily smokers and 5 matched control nonsmokers from NHANES in terms of blood lead levels in mu-g/L.  The matching controlled for gender, age, race education level, and household income.  The data were used in Rosenbaum (2013) to contrast design sensitivity with matched pairs and with multiple controls.  See also lead250.  Used as an example to illustrate the senmv function in the sensitivitymv package.
}
\usage{data(lead150)}
\format{
  Column 1 is the lead level for the daily smoker.  Columns 2 through 6 are lead levels for the five matched control nonsmokers.
}
\details{
See the appendix to Rosenbaum (2013).
}
\source{
NHANES 2007-2008 files from CDC and Rosenbaum (2013).  Under a conventional Gaussian model, 250 pairs and 150 1-5 matched sets should have the same standard error; however, the design sensitivity is not the same.
}
\references{
Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.
}
\examples{
data(lead150)
}
\keyword{datasets}
