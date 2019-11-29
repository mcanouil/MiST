\name{MiST-package}
\alias{MiST-package}
\alias{MiST}
\docType{package}
\title{
        Mixed effects Score Test
}
\description{
Test for association between a set of SNPS/genes and continuous or binary outcomes by including variant characteristic information and using score statistics.
}
\details{
\tabular{ll}{
Package: \tab MiST\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-03-18\cr
License: \tab LGPL (>= 2.0) \cr
LazyLoad: \tab yes\cr
}
linear.test(y, X, G, Z, method = "liu")

linear.weight.test(y, X, G, Z, maf, weight.beta = c(1, 25), method = "liu")

logit.test(y, X, G, Z, method = "liu")

logit.weight.test(y, X, G, Z, maf, weight.beta = c(1, 25), method = "liu")
}
\author{
         Jianping Sun, Yingye Zheng, and Li Hsu.

%Maintainer: Who to complain to <yourfault@somewhere.net>
%~~ The author and/or maintainer of the package ~~
}
\references{
    Sun, J., Zheng, Y., and Hsu, L. (2013) A Unified Mixed-Effects Model for Rare-Variant Association in Sequencing Studies. Genet Epidemiol. 2013 Mar 9. doi: 10.1002/gepi.21717
    
    H. Liu, Y. Tang, H.H. Zhang (2009) A new chi-square approximation to the distribution of non-negative definite quadratic forms in non-central normal variables, 
    Computational Statistics and Data Analysis, 53, 853-856.
}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
%~~ the R documentation directory ~~
\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
%\examples{
%~~ simple examples of the most important functions ~~
%}
