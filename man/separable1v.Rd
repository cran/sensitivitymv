\name{separable1v}
\alias{separable1v}
\concept{Sensitivity analysis}
\concept{Separable approximation}
\title{
Asymptotic separable calculations internal to other functions.
}
\description{
This general purpose function is internal to other functions, such as senmv in the sensitivitymv package.  The function performs the asymptotic separable calculations described in Gastwirth, Krieger and Rosenbaum (2000), as used in section 4 of Rosenbaum (2007).  The example is equivalent to senmv(lead150,gamma=2,method="t").
}
\usage{
separable1v(ymat, gamma = 1)
}
\arguments{
  \item{ymat}{
ymat is a matrix whose rows are matched sets and whose columns are matched individuals.  The first column describes treated individuals.  Other columns describe controls.  If matched sets contain variable numbers of controls, NAs fill in empty spaces in ymat; see the documentation for senmv.  In senmv, the matrix ymat is created by mscorev.  Instead, if there were no NAs and ranks within rows were used in ymat, then separable1v would perform a sensitivity analysis for the stratified Wilcoxon two-sample test.  Applied directly to data, it performs a sensitivity analysis for the permutational t-test.
}
  \item{gamma}{
gamma is the value of the sensitivity parameter; see the documentation for the senmv function in the sensitivitymv package.  One should use a value of gamma >= 1.
}
}

\value{
\item{pval}{Approximate upper bound on the one-sided P-value.}
\item{deviate}{Deviate that is compared to the upper tail of the standard Normal distribution to obtain the P-value.}
\item{statistic}{Value of the test statistic.}
\item{expectation}{Maximum null expectation of the test statistic for the given value of gamma.}
\item{variance}{Among null distributions that yield the maximum expectation, variance is the maximum possible variance for the given value of gamma.  See Rosenbaum (2007, Section 4) and Gastwirth, Krieger and Rosenbaum (2000).}
}

\references{
Gastwirth, J. L., Krieger, A. M., and Rosenbaum, P. R. (2000) Asymptotic separability in sensitivity analysis.  Journal of the Royal Statistical Society B 2000, 62, 545-556.

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.
}

\author{
Paul R. Rosenbaum
}

\examples{
data(lead150)
separable1v(lead150,gamma=2)
}
