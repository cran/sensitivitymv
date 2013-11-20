\name{sensitivitymv-package}
\alias{sensitivitymv-package}
\alias{sensitivitymv}
\docType{package}
\title{
Sensitivity analysis for observational studies
}
\description{
Sensitivity analysis for matched observational studies with one or more controls using Huber-Maritz M-tests or the permutational t-test.
}
\details{
\tabular{ll}{
Package: \tab sensitivitymv\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-11-03\cr
License: GPL-2
LazyLoad: \tab yes\cr
}

The main function in the sensitivitymv package is senmv.

The sensitivitymv package performs sensitivity analyses in matched observational studies using Huber-Maritz M-tests, including the permutational t-test.  There can be matched treatment-control pairs, or matched sets with one treated subject and a fixed number of controls, or matched sets with one treated subject and a variable number >=1 of controls.  The package name, sensitivitymv, refers to sensitivity analyses with M-statistics and variable controls.

The sensitivity analysis asks about the magnitude, gamma, of bias in treatment assignment in observational studies that would need to be present to alter the conclusions of a randomization test that assumed matching for observed covariates removes all bias.  The method implemented in sensitivitymv is essentially the method described in Rosenbaum (2007); see also Rosenbaum (2013).  For general discussion of senstivity analyses in observational studies, see Chapter 4 of Rosenbaum (2002).

M-tests perform hypothesis tests using the statistics that Huber equated to zero in defining his M-estimates.  The mean is one of many possible M-statistics.  As developed by Maritz (1979), M-tests differ in some details from M-estimates.  In particular, Maritz uses a scale factor that is fixed under the null hypothesis.  Maritz developed his method for matched pairs, but it easily extends to matching with multiple or variable controls; see Rosenbaum (2007, Section 4).

The permutational t-test permutes the observations themselves rather than permuting robust scores derived from the observations.  It is, of course, of historical interest, but it also continues to attract current attention because of its close connections to the average treatment effect and to the average effect of the treatment on the treated.  See the method="t" option in senmv.

The main function in the sensitivitymv package is senmv.  Other functions are truncatedP and truncatedPbv that combine independent P-values using the truncated product of Zaykin et al. (2002) and the amplify function that interprets values of gamma using the method in Rosenbaum and Silber (2009).

In a straightforward way, the senmv package may be used in calculations for approximate evidence factors in the sense of Rosenbaum (2011); see documentation for the truncatedP or truncatedPbv functions.

There are six data sets, erpcp, tbmetaphase, mercury, mtm, lead150 and lead250 .  As noted in the documentation for senmv and truncatedP, these three data sets may be used to reproduce analyses from the cited literature, as illustrated in the examples for senmv and truncatedP.  The documentation for mscorev shows how to reproduce an intermediate result, specifically Table 3 in Rosenbaum (2007).
}
\author{
Paul Rosenbaum

Maintainer: Paul R. Rosenbaum <rosenbaum@wharton.upenn.edu>

}
\references{

Huber, P. (1981) Robust Statistics.  New York: Wiley, 1981.

Maritz, J. S. (1979) Exact robust confidence intervals for location.  Biometrika 1979, 66, 163-166.

Rosenbaum, P. R. (2002) Observational Studies (2nd edition).  New York: Springer.

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.

Rosenbaum, P. R. and Silber, J. H. (2009) Amplification of sensitivity analysis in observational studies.  Journal of the American Statistical Association, 104, 1398-1405.

Rosenbaum, P. R. (2011) Some approximate evidence factors in observational studies.  Journal of the American Statistical Association, 106, 285-295.

Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.

Zaykin, D. V., Zhivotovsky, L. A., Westfall, P. H. and Weir, B. S. (2002) Truncated product method of combining P-values.  Genetic Epidemiology, 22, 170-185.

}

\keyword{ package }


