\name{mscorev}
\alias{mscorev}

\title{
Computes the M-scores used by senmv.
}
\description{
Computes the M-scores used by senmv for sensitivity analysis in observational studies using Huber-Maritz M-tests.
}
\usage{
mscorev(ymat, inner = 0, trim = 2.5, qu = 0.5, TonT = FALSE)
}

\arguments{
  \item{ymat}{
ymat is a matrix as described in the documentation for senmv.
}
  \item{inner}{
inner is the parameter described in the documentation for senmv.
}
  \item{trim}{
trim is the parameter described in the documentation for senmv.
}
  \item{qu}{
qu is the lambda parameter described in the documentation for senmv.
}
\item{TonT}{
If TonT=FALSE, then the total score in set (row) i is divided by the number ni of individuals in row i, as in expression (8) in Rosenbaum (2007).  If TonT=TRUE, then the division is by ni-1, not by ni, and there is a further division by the total number of matched sets.  See the discussion of TonT in the documentation for senmv.
}
}

\value{
Generally, a matrix with the same dimensions as ymat containing the M-scores.  Exception: if a matched set does not contain at least one treated subject and at least one control, then that set will not appear in the result, and the result will have fewer rows than ymat.  However, if a matched set has several controls but no treated subject, then these controls will contribute to the estimate of the scale parameter, typically the median absolute pair difference.
}
\references{
Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.

Rosenbaum, P. R. (2015). Two R packages for sensitivity analysis in observational studies. Observational Studies, 1(1), 1-17.  Free on-line at obsstudies.org
}
\author{
Paul R. Rosenbaum
}

\note{
The example reproduces Table 3 in Rosenbaum (2007).
}

\examples{

data(tbmetaphase)
mscorev(tbmetaphase,trim=1)
}
