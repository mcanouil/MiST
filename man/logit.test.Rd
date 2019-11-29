\name{logit.test}
\alias{logit.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Mixed effects Score Test for binary outcomes
}
\description{
  Test for association between a set of SNPS/genes and binary outcomes by including variant characteristic information and using score statistics.
}
\usage{
logit.test(y, X, G, Z, method = "liu")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
            a numeric (0 or 1) vector of the binary outcome variables. Missing values are not allowed.
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

######################################################################
# Test the association between a set of SNPs and binary outcomes    
#   - without information about SNP characteristics. Z is a vector of 1's.     

out <- logit.test(y.bin, X, G, Z) 


######################################################################
#	Test the association between a set of SNPs and bianry outcomes    
#	- including SNP characteristics        

out <- logit.test(y.bin, X, G, Z.func) 
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
