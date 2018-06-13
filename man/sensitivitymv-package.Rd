\name{sensitivitymv-package}
\alias{sensitivitymv-package}
\alias{sensitivitymv}
\concept{Sensitivity analysis}
\concept{Observational study}
\concept{Causal inference}
\docType{package}
\title{
\packageTitle{sensitivitymv}
}
\description{
\packageDescription{sensitivitymv}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{sensitivitymv}
\packageIndices{sensitivitymv}
}
\author{
\packageAuthor{sensitivitymv}

Maintainer: \packageMaintainer{sensitivitymv}
}
\references{
Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464. <doi:10.1111/j.1541-0420.2006.00717.x>

Rosenbaum, P. R. (2010) Design of Observational Studies.  New York: Springer <doi:10.1007/978-1-4419-1213-8> Section 2.9 explains randomization inference with M-statistics in an example with 5 matched pairs.

Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127. <doi:10.1111/j.1541-0420.2012.01821.x>

Rosenbaum, P. R. (2015). Two R packages for sensitivity analysis in observational studies. Observational Studies, 1(1), 1-17.  Free on-line at obsstudies.org

Rosenbaum, P. R. (2017) Observation and Experiment: An Introduction to Causal Inference.  Cambridge, MA: Harvard University Press.  Chapter 9 discusses sensitivity analysis.
}
\keyword{ package }
\examples{
# Example reproduces parts of sect. 4.3 in Rosenbaum (2007)
data(tbmetaphase)
senmv(tbmetaphase,gamma=2,trim=1)
}
