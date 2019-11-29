\name{MiST.data}
\alias{MiST.data}
\docType{data}
\title{
Data Example for MiST
}
\description{
  A numerical data example for MiST
}
\usage{data(MiST.data)}

\format{
  MiST.data contains the following objects:
  
%\describe{
\itemize{
%\enumerate{
  \item{G: } {
             a numeric genotype matrix of 3400 individuals and 93 SNPs. 
             Each row represents a individual, and each column represents a SNP marker.
           }
           
  \item{X: } {
             a numeric matrix of covariates with the first column represents intercept, the second column represents a continuous covariate,
             and the third column represents a binary covariate.
           }
           

  \item{Z: } {
             a numeric vector of 1s for the second level covariate. 
           }
           
           
  \item{Z.func: } {
                  a numeric matrix for the second level covariate. The first column contains all 1s, representing the intercept, and the second column
                  is 0 or 1, representing whether a SNP marker is functional or non-functional.
           }
                          

  \item{maf: } {
               a numeric vector for the Minor Allele Frequecy of 93 SNPs.
           }
           
  \item{y.con: } {
                 a numeric vector of continuous outcomes.
           }
              
               
  \item{y.bin: } {
                 a numeric vector of binary outcomes.
           }
    }               
}

%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(MiST.data)

}
\keyword{datasets}
