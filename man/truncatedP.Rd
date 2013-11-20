\name{truncatedP}
\alias{truncatedP}
\title{
Trucated product of P-values.
}
\description{
Zaykin et al. (2002) proposed combining L=length(p) independent P-values p by taking the product of the P-values that are no larger than a truncation point trunc, namely w = prod(p^(p<=trunc)).  Computes the one P-value for the combination w.

}
\usage{
truncatedP(p, trunc = 0.2)
}
\arguments{
  \item{p}{
	a vector of P-values that are either independent or stochastically larger than the uniform distribution on the cube (see Rosenbaum (2011, Definition 1))
}
  \item{trunc}{
	trucation point.  Computes the product of all P-values in p that are no larger than trunc.  For trunc = 1, performs Fisher's method of combining independent P-values.
}
}
\details{
Zaykin et al. (2002) proposed combining L=length(p) independent P-values p by taking the product of the P-values that are no larger than a truncation point trunc, namely w = prod(p^(p<=trunc)).  For trunc = 1, this is Fisher's method for combining independent P-values.  The method also works for certain kinds of fairly inconsequential dependence; see Rosenbaum (2011, section 2).

trucatedP computes the one P-value for the combination w using the formula in Zaykin et al. (2002).  The equivalent function truncatedPbg computes the exact same P-value for w using a binomial mixture of gamma distributions, as discussed by Hsu et al. (2013, section 3.1).

The truncated product or Fisher's method (trunc = 1) may be used for sensitivity analyses with evidence factors; see Rosenbaum (2011) and the mtm example below.  

The truncated product with trunc < 1 is useful in combining P-value upper bounds produced by sensitivity analyses, for instance those produced by senmv.  These upper bounds eventually approach 1 for larger values of the sensitivity parameter, and trunc < 1 eliminates these, often increasing power.  See Hsu et al. (2013) for comparisons.
}
\value{
	Returns the one P-value for the truncated product.  For trunc < 1, the distribution is not continuous, but rather attaches positive probability to a P-value of 1.
}
\references{
Hsu, J. Y., Small, D. S. and Rosenbaum, P. R. (2013) Effect modification and design sensitivity in observational studies.  Journal of the American Statistical Association, 108, 135-148.

Meibian, Z., Zhijian, C., Qing, C. et al. (2008) Investigating DNA damage in tannery workers occupationally exposed to tivalent chromium using the comet assay.  Mutation Research 654, 45-51.

Rosenbaum, P. R. (2010) Evidence factors in observational studies.  Biometrika, 97, 333-345.

Rosenbaum, P. R. (2011) Some approximate evidence factors in observational studies.  Journal of the American Statistical Association, 106, 285-295.

Zaykin, D. V., Zhivotovsky, L. A., Westfall, P. H. and Weir, B. S. (2002) Truncated product method of combining P-values.  Genetic Epidemiology, 22, 170-185.

Zhang, K., Small, D. S., Lorch, S., Srinivas, S. and Rosenbaum, P. R. (2011) Using split samples and evidence factors in an observational study of neonatal outcomes.  Journal of the American Statistical Association, 106, 511-524.
}
\author{
Paul R. Rosenbaum
}
\note{
Example mtm illustrates approximate evidence factors and almost reproduces parts of section 6 of Rosenbaum (2011) using the mtm data from Meibian et al. (2008).  The second P-value bound differs slightly from that reported in the paper.  The reason is that the paper used one scale factor, the median absolute pair difference, for both tests based on all pairs, whereas senmv applied to the last two columns of mtm uses a scale factor derived just from these two columns.  There is no obvious reason to prefer one approach over the other, and the approach in the paper would require a separate R function.  Note that in this example, y is -mtm because we test that the controls are low rather than high.
}

\examples{
# Evidence factor example: see note above.
	data(mtm)
	senmv(-mtm,gamma=11.7,trim=1)
	senmv(-mtm[,2:3],gamma=2.1,trim=1)
	senmv(-mtm,gamma=12,trim=1)
	senmv(-mtm[,2:3],gamma=3,trim=1)
	truncatedP(c(0.05167572,0.1527849),trunc=1)
	truncatedP(c(0.05167572,0.1527849),trunc=.2)
}

