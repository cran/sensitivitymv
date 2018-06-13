\name{lead250}
\alias{lead250}
\concept{Observational study}
\concept{Causal inference}
\concept{Matched pairs}
\docType{data}
\title{
Smoking and lead in 250 matched pairs.
}
\description{
Comparison of 250 daily smokers and one matched control nonsmoker from NHANES in terms of blood lead levels in mu-g/L.  The matching controlled for gender, age, race education level, and household income.  The data were used in Rosenbaum (2013) to contrast design sensitivity with matched pairs and with multiple controls.  See also lead150.  Used as an example to illustrate the senmv function in the sensitivitymv package.
}
\usage{data(lead250)}
\format{
  Column 1 describes the smoker and column 2 describes the matched nonsmoker.
}
\details{
See the appendix to Rosenbaum (2013).  Under a conventional Gaussian model, 250 pairs and 150 1-5 matched sets should have the same standard error; however, the design sensitivity is not the same.
}
\source{
NHANES 2007-2008 from CDC and Rosenbaum (2013).
}
\references{
Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.
}
\examples{
data(lead250)
}
\keyword{datasets}
