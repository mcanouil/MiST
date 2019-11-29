\name{linear.weight.test}
\alias{linear.weight.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Weighted Mixed effects Score Test for continuous outcomes
}
\description{
  Test for association between a set of SNPS/genes and continuous outcomes by including variant characteristic information and using weighted score statistics.
}
\usage{
linear.weight.test(y, X, G, Z, maf, weight.beta = c(1, 25), method = "liu")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
            a numeric vector of the continuous outcome variables. Missing values are not allowed.
}
  \item{X}{
            a numeric matrix of covariates with rows for individuals and columns for covariates. 
            %% If there is no covariate, it does not need to be specified
}
  \item{G}{
            a numeric genotype matrix with rows for individuals and columns for SNPs. 
            Each SNP should be coded as 0, 1, and 2 for AA, Aa, aa, where A is a major allele and a is a minor allele. 
            Missing genotypes are not allowed.
}
  \item{Z}{
            a numeric matrix of second level covariates for variant characteristics. 
            Each row corresponds to a variant and each column corresponds to a variant characteristic.
            If there is no second level covariates, a vector of 1 should be used.
}
  \item{maf}{
              a numeric vector of MAF (minor allele frequency) for each SNP.
}
  \item{weight.beta}{
              a numeric vector of parameters of beta function which is the weight for score statistics. The default value is "c(1,25)".
}
  \item{method}{
                 a method to compute the p-value and the default value is "liu". 
                 Method "davies" represents an exact method that computes the p-value by inverting the characteristic function of the mixture chisq.
                 Method "liu" represents an approximation method that matches the first 3 moments.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
    \item{S.tau }{ score statistic for the variant hetergenous effect. }
    \item{S.pi }{ score statistic for the variant mean effect. }
    \item{p.value.S.tau}{ p-value for testing the variant hetergenous effect. }
    \item{p.value.S.pi}{ p-value for testing the variant mean effect. }
    \item{p.value.overall}{ overall p-value for testing the association between the set of SNPS/genes and outcomes. 
          It combines p.value.S.pi and p.value.S.tau by using Fisher's procedure. }
}
\references{
    Sun, J., Zheng, Y., and Hsu, L. (2013) A Unified Mixed-Effects Model for Rare-Variant Association in Sequencing Studies. Genet Epidemiol. 2013 Mar 9. doi: 10.1002/gepi.21717
    
    H. Liu, Y. Tang, H.H. Zhang (2009) A new chi-square approximation to the distribution of non-negative definite quadratic forms in non-central normal variables, 
    Computational Statistics and Data Analysis, 53, 853-856.
}
\author{
         Jianping Sun, Yingye Zheng, and Li Hsu.
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
data(MiST.data)
attach(MiST.data)

##########################################################################
# Test the association between a set of SNPs and continuous outcomes    
#   - without information about SNP characteristics. Z is a vector of 1's.          


out <- linear.weight.test(y.con, X, G, Z, maf) 


##########################################################################
# Test the association between a set of SNPs and continuous outcomes    
#	- including SNP characteristics            


out <- linear.weight.test(y.con, X, G, Z.func, maf) 

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
