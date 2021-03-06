\name{senmv}
\alias{senmv}
\concept{Sensitivity analysis}
\concept{Observational study}
\concept{Causal inference}
\concept{M-statistic}

\title{
Sensitivity analysis in observational studies using Huber-Maritz M-statistics.
}
\description{
Computes the large sample approximation to the upper bound on the one sided P-value testing the null hypothesis of no treatment effect in a matched observational study with one or more controls matched to each treated subject.  Uses Huber's M-statistics as test statistics in the sense proposed by Maritz (1979).  Use of senmv() is discussed and illustrated in Rosenbaum (2015a). As a possible alternative to senmv(), please consider the functions senm() and senmCI() functions in the sensitivitymult package -- they are more recent implementations that add confidence intervals with simpler input.
}
\usage{
senmv(y, gamma = 1, method = NULL, inner = 0, trim = 2.5,

	 lambda = 1/2, tau = 0, TonT=FALSE)
}

\arguments{
  \item{y}{
If y is a vector, then y is the vector of treated-minus-control pair differences in outcomes in n=length(y) matched pairs.  If y is an n by J matrix, then: (i) the rows are n matched sets, (ii) the first column is the treated response in a set, columns 2 to J contain the responses of controls in the same matched set.  If a matched set has fewer than J-1 controls, then NA's fill the empty spaces in y.  The test is one-sided, testing no treatment effect against the alternative hypothesis that treated responses are higher than control responses.  Replace y by -y to test against the alternative that treated responses are lower than control responses; see the mtm example.
}
  \item{gamma}{
gamma is the sensitivity parameter, gamma=1 for a randomization test, gamma>1 for sensitivity bounds.  Use of gamma<1 will generate an error.  This parameter gamma is denoted by the upper case Greek letter gamma in the cited literature, for instance Rosenbaum (2007).
}
  \item{method}{
If method is NULL, then the method is determined by the parameters, namely inner, trim, lambda, and TonT.  If method is not NULL, then these parameters are set according to the selected method and stated values of the parameters are ignored.  The default values of the parameters are equivalent to method="h".
(i) method = "h" (Huber) is the default and sets inner=0, trim=2.5, lambda = 1/2, TonT=FALSE.  Its psi function levels off at 2.5 times the median (lambda = 1/2) of the absolute pair differences.  Method h is often a good choice in small samples with few pairs or sets.  Method h is often a good choice when the number of controls in each matched set is 6 or more.  For long tailed distributions, it may be better to use the same parameter values except with a lower value of trim, perhaps trim = 2 or trim = 1.
(ii) method = "i" (inner) often has better design sensitivity than method = "h".  It has inner = 1/2, ignoring absolute pair differences smaller than half the median.  It has inner=1/2, trim=2.5, lambda = 1/2, TonT=FALSE.  Method i is often a good choice for a moderate to large sample of matched pairs, say 100 or more pairs.  Method i is often a good choice for a moderate to large number of matched triples, say 100 or more.  See Rosenbaum (2013) for comparisons of methods h and i.
(iii) method = "t" (permutational t-test) permutes the observations themselves, not scores derived from the observations.  It has inner=0, trim=Inf, lambda = 1/2, TonT=TRUE.  This is the only method that sets TonT=TRUE.  The test statistic gives the mean over sets of the mean treated-minus-control difference within sets, that is, the usual estimate of the effect of the treatment on the treated.  See the example for mercury using method="t" and the discussion of the TonT parameter.
}
  \item{inner}{
Inner trimming to increase design sensitivity.  See the discussion of lambda.  Use of inner<0 or inner>trim will generate an error.
}
  \item{trim}{
Outer trimming for resistance to outliers.  Setting trim = Inf does no trimming.  See the discussion of lambda.
}
  \item{lambda}{
Observations are scaled by the lambda quantile of the absolute pair differences, defaulting to the median of all paired absolute differences; see Rosenbaum (2007, section 4.2) for a precise definition in the case of multiple controls.  If the lambda quantile of the absolute pair differences is 0, then scaling by 0 is impossible and an error may result; the solution is to increase lambda.  If qu is the lambda quantile, absolute pair differences smaller than inner*qu receive weight 0, absolute pair differences larger than qu*trim receive weight 1, and between inner*qu and trim*qu weights increase linearly from 0 to 1.  Use of lambda<=0 or lambda>=1 will generate an error.  If inner=0 and trim=Inf, then this results in the permutational t-test in which the observations themselves are permuted, and in this case lambda is not used.  Taking lambda = .95 and trim = 1 is similar to trimming 5 percent of the pair differences.
}
\item{tau}{
If tau=0, senmv tests the null hypothesis of no treatment effect.  If tau is not 0, senmv tests the null hypothesis that the treatment effect is an additive shift of tau against the alternative that the effect is larger than tau.
}
\item{TonT}{
TonT refers to the effect of the treatment on the treated.  The default is TonT=FALSE.  For all methods except method="t", TonT=FALSE.  TonT=TRUE is mostly relevant to the permutational t-test, method="t", but it remains an option whenever is.null(method)=TRUE.  If TonT=FALSE, then the total score in set (row) i is divided by the number ni of individuals in row i, as in expression (8) in Rosenbaum (2007).  This division by ni has few consequences when every matched set has the same number of individuals, but when set sizes vary, dividing by ni is intended to increase efficiency by weighting inversely as the variance; see the discussion in section 4.2 of Rosenbaum (2007).  If TonT=TRUE, then the division is by ni-1, not by ni, and there is a further division by the total number of matched sets to make it a type of mean.  If TonT=TRUE, then the statistic is the mean over matched sets of the treated-score minus the mean-of-the-control-scores within matched sets, so it is weighted to estimate the effect of the treatment on the treated.  See the mercury example with method="t".
}
}
\value{
\item{pval}{Approximate upper bound on the one-sided P-value.}
\item{deviate}{Deviate that is compared to the upper tail of the standard Normal distribution to obtain the P-value.}
\item{statistic}{Value of the test statistic.}
\item{expectation}{Maximum null expectation of the test statistic for the given value of gamma.}
\item{variance}{Among null distributions that yield the maximum expectation, variance is the maximum possible variance for the given value of gamma.  See Rosenbaum (2007, Section 4) and Gastwirth, Krieger and Rosenbaum (2000).}
}
\details{
The one-sided alternative hypothesis is that treatment increases the level of response.
The senmv function has as its default the use of Huber's (1981) psi function, which is similar in certain respects to a trimmed mean.  By default, the trimming occurs (i.e., Huber's psi function becomes horizonal) at trim=2.5 times the median (i.e., lambda = 1/2) of the absolute pair differences; see Maritz (1979) for the paired case and see Rosenbaum (2007, section 4) for matched sets with one or more controls.  With trim = 2.5, Huber's psi function is somewhat analogous to a trimmed mean that trims five percent from each tail.  If trim is changed to 1, then the psi function is horizonal at 1 times the median (i.e., lambda=1/2) of the absolute pair differences and is somewhat analogous to a midmean.

method="t" performs the permutational t-test, the permutation distribution of a type of mean; see, for instance, Pitman (1937).

The senmv function can be used in the calculation of approximate evidence factors, as discussed and illustrated in the documentation for the truncatedP and truncatedPbg functions.
}
\references{
Main references:
Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.  This paper is the main reference for the senmv function when weights are not used, m1=m2=m=1. <doi:10.1111/j.1541-0420.2006.00717.x>

Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.  Evaluates the performance of the methods in the paper above, and in particular provides a basis for selecting the parameter values for senmv.  In particular, this paper compares methods h, i, and t.  <doi:10.1111/j.1541-0420.2012.01821.x>

Rosenbaum, P. R. (2015a). Two R packages for sensitivity analysis in observational studies. Observational Studies, 1(1), 1-17.  Free on-line at obsstudies.org
---------------------------------------
Additional references:
Cox, D. R. and Reid, N. Theory of the Design of Experiments.  New York: Chapman and Hall/CRC.  Chapter 2 discusses randomization inference, in particular an unmatched version of the permutation distributiom of the treated minus control difference in mean responses, or the two-sample (unmatched) permutational t-test.  Although there is a large old literature on tests that permute the observations, this recent discussion is written in a modern style.

Fisher, R. A. (1935) Design of Experiments.  Edinburgh: Oliver and Boyd.  Chapter 3 contains an early, conceptual discussion of the permutation distribution of the mean or the permutational t-test.

Huber, P. (1981) Robust Statistics.  New York: Wiley, 1981.  Huber first proposed the use of m-statistics in 1964 in a paper in the Annals.

Maritz, J. S. (1979) Exact robust confidence intervals for location.  Biometrika 1979, 66, 163-166.  Proposed exact permutation tests using m-statistics that Maritz inverts to obtain exact confidence limits.  The subtle aspect is the scaling which must be invariant to treatment assignment under the null hypothesis, so it differs from the scaling used by Huber.

Gastwirth, J. L., Krieger, A. M., and Rosenbaum, P. R. (2000) Asymptotic separability in sensitivity analysis.  Journal of the Royal Statistical Society B 2000, 62, 545-556.  Provides a general large sample approximation when matching with multiple controls, as used in Rosenbaum (2007, Section 4).

Pitman, E. J. G. (1937) Significance tests which may be applied to samples from any populations.  JRSS-supplement (later called series B), 4, 119-130.  An early technical discussion of the permutation distribution of the sample mean, or the permutational t-test.

Rosenbaum, P. R. (2010) Design of Observational Studies.  New York: Springer 2010.  <doi:10.1111/j.1541-0420.2012.01821.x> Section 2.9 contains an elementary textbook discussion of Maritz's permutation distribution for m-statistics.

Rosenbaum, P. R. (2011) Some approximate evidence factors in observational studies.  Journal of the American Statistical Association, 2011, 106, 285-295.  <doi:10.1198/jasa.2011.tm10422> The method described in this paper may be implemented using senmv.  To do this, one uses senmv several times, combining the resulting one-sided P-value bounds, perhaps using Fisher's method for combining P-values.  In the example of this paper, y is n x 3 for three groups in matched triples, and the paper uses Fisher's method to combine the P-value bounds from senmv(y) and senmv(y[,2:3]) for an appropriately defined y.  See the mtm example in the documentation for truncatedP and truncatedPbg.

Rosenbaum, P. R. (2015b). How to see more in observational studies: Some new quasi-experimental devices. Annual Review of Statistics and Its Application, 2, 21-48.  Discusses evidence factors. <doi/10.1146/annurev-statistics-010814-020201>

Rosenbaum, P. R. (2017) Observation and Experiment: An Introduction to Causal Inference.  Cambridge, MA: Harvard University Press.  Sensitivity analysis is discussed in Chapter 9.

Welch, B. L. (1937) On the z-test in randomized blocks.  Biometrika 29, 21-52.  As in Pitman (1937) above, discusses permutation inference in which the responses are permuted, essentially a permutational F-test.  Expresses causal effects as comparisons of potential responses under alternative treatments.
}
\author{
Paul R. Rosenbaum
}

\note{
Example erpcp reproduces parts of Table 1 in Rosenbaum (2007), example tbmetaphase reproduces parts of section 4.3 in Rosenbaum (2007). Examples lead150 and lead250 reproduce parts of Table 1 of Rosenbaum (2013).

Example mtm almost reproduces parts of section 6 of Rosenbaum (2011).  The second P-value bound differs slightly from that reported in the paper.  The reason is that the paper used one scale factor, the median absolute pair difference, for both tests based on all pairs, whereas senmv applied to the last two columns of mtm uses a scale factor derived just from these two columns.  There is no obvious reason to prefer one approach over the other, and the approach in the paper would require a separate R function.  Note that in this example, y is -mtm because we test that the controls are low rather than high.

See the help file for mscorev to reproduce Table 3 in Rosenbaum (2007).

The mercury example illustrates the TonT parameter in a trivial case, because every treated subject has two controls.  Note that the test statistic is a kind of mean when TonT=TRUE, but is merely a sum when TonT=FALSE.  The weighting used when TonT=FALSE means the test statisitic uses information efficiently under certain models, but the test statistic itself is not an estimate of anything.  Note the effect of setting tau = 2 is to reduce the test statistic by 2 when method="t".
}



\examples{

# This example reproduces parts of Table 1 in Rosenbaum (2007).
data(erpcp)
senmv(erpcp,gamma=3,trim=1)
senmv(erpcp,gamma=2,trim=1)
senmv(erpcp,gamma=2,trim=1,tau=0.34)
senmv(erpcp,gamma=2,trim=1,tau=0.18)
senmv(erpcp,gamma=2,trim=1,tau=0.185)

# Example reproduces parts of sect. 4.3 in Rosenbaum (2007)
data(tbmetaphase)
senmv(tbmetaphase,gamma=2,trim=1)
senmv(tbmetaphase,gamma=2,trim=1,tau=0.94)
senmv(tbmetaphase,gamma=2,trim=1,tau=0.945)

# Example reproduces part of Table 1 in Rosenbaum (2013)
data(lead150)
senmv(lead150,gamma=2,trim=2)
data(lead250)
senmv(lead250,gamma=2,trim=2)

# Example reproduces parts of of Rosenbaum (2011).  See documentation for truncatedP.
data(mtm)
senmv(-mtm,gamma=11.7,trim=1)
senmv(-mtm[,2:3],gamma=2.1,trim=1)

# Illustrates method = "i"
data(mercury)
senmv(mercury,gamma=15)
senmv(mercury,gamma=15,method="i")

# Illustrates TonT=TRUE as in method="t".  See note above.
data(mercury)
mean(mercury[,1])-(mean(mercury[,2])+mean(mercury[,3]))/2
senmv(mercury,gamma=15,trim=Inf,TonT=TRUE)$statistic
senmv(mercury,gamma=15,method="t")$statistic
senmv(mercury,gamma=15,method="t",tau=1)$statistic
senmv(mercury,gamma=15,method="t",tau=2)$statistic
senmv(mercury,gamma=15,trim=Inf,TonT=FALSE)$statistic
}
