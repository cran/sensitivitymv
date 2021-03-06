\name{newurks}
\alias{newurks}

\title{
	Approximate scores for ranks of row ranges.
}
\description{
	Of limited interest to most users, this function is sometimes called by senmv.  The function calculates the ranges for each row of smat, scores their ranks using the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011), as implemented in the function multrnks, and multiplies the rows by these rank scores.
}
\usage{
newurks(smat, m1 = 2, m2 = 2, m = 2)
}
\arguments{
  \item{smat}{
	A matrix.  When called by senmv, smat is a matrix produced by mscorev.
}
  \item{m1}{
	One of three rank score parameters in Rosenbaum (2011), specifically m1 = underline(m).
}
  \item{m2}{
	One of three rank score parameters in Rosenbaum (2011), specifically m2 = overline(m).
}
  \item{m}{
	One of three rank score parameters in Rosenbaum (2011), specifically m = m.
}
}

\value{
	The function calculates the ranges for each row of smat, scores the ranks of the ranges using the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011), as implemented in the function multrnks, and multiplies the rows of smat by these rank scores, returning the result.
}
\references{
	Rosenbaum, P. R. (2011) A new u-statistic with superior design sensitivity in matched observational studies.  Biometrics 67, 1017-1027.
}
\author{
	Paul R. Rosenbaum
}

\examples{
	data(lead150)
 	head(newurks(mscorev(lead150)))
}
