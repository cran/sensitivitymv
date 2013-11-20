\name{multrnks}
\alias{multrnks}
\title{
	Approximate scores for ranks.
}
\description{
	Of limited interest to most users, this function is sometimes called by senmv.  The function calculates the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011).
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
	Rosenbaum, P. R. (2011) A new u-statistic with superior design sensitivity in matched observational studies.  Biometrics 67, 1017-1027.
}
\author{
	Paul R. Rosenbaum
}

\examples{
	multrnks(1:10)
	multrnks(1:10,m1=12,m2=20,m=20)
}

