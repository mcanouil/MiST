#' MiST.data
#'
#' @format A [[list]] object.
#'
#' @details `MiST.data` contains:
#'
#'  * `G` a numeric genotype matrix of 3400 individuals and 93 SNPs. Each row represents a individual, and each column represents a SNP marker.
#'  * `X` a numeric matrix of covariates with the first column represents intercept, the second column represents a continuous covariate, and the third column represents a binary covariate.
#'  * `Z` a numeric vector of 1s for the second level covariate.
#'  * `Z.func` a numeric matrix for the second level covariate. The first column contains all 1s, representing the intercept, and the second column is 0 or 1, representing whether a SNP marker is functional or non-functional.
#'  * `maf` a numeric vector for the Minor Allele Frequecy of 93 SNPs.
#'  * `y.con` a numeric vector of continuous outcomes.
#'  * `y.bin` a numeric vector of binary outcomes.
#'
#' @source [GSE74821](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE74821)
"MiST.data"
