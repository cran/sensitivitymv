\name{multrnks}
\alias{multrnks}
\title{
	Approximate scores for ranks.
}
\description{
	Of limited interest to most users, this function is sometimes called by senmv.  The function calculates the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011).  See also
	Rosenbaum (2014) and the sensitivitymw package.
}
\usage{
multrnks(rk, m1 = 2, m2 = 2, m = 2)
}
\arguments{
  \item{rk}{
	A vector of ranks that may include average ranks for ties.
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
	Vector of length(rk) containing the scores for the ranks in rk.
}
\references{
	Rosenbaum, P. R. (2011) <doi:10.1111/j.1541-0420.2010.01535.x> A new u-statistic with superior design sensitivity in matched observational studies.  Biometrics 67, 1017-1027.

Rosenbaum, P. R. (2014) <doi:10.1080/01621459.2013.879261> Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls. Journal of the American Statistical Association, 109(507), 1145-1158.

Rosenbaum, P. R. (2024) <doi:10.1080/01621459.2023.2221402> Bahadur efficiency of observational block designs. Journal of the American Statistical Association, 119(547), 1871-1881.
}
\author{
	Paul R. Rosenbaum
}

\examples{
	multrnks(1:10)
	multrnks(1:10,m1=12,m2=20,m=20)
}
\keyword{ nonparametric }
