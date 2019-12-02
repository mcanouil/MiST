#' mist_data
#'
#' @format A [[list]] object.
#'
#' @details `mist_data` contains:
#'
#'  * `phenotypes` a data.frame with outcomes (continuous and binary) and covariates.
#'  * `G` a numeric matrix of genotypes
#'  * `Z` a numeric matrix with information on variants, *i.e.*, group, maf and effect.
#'
# set.seed(20191203)
#
# sample_size <- 100
# n_variant <- 10
#
# variant_effects <- setNames(rnorm(n_variant, sd = 2), paste0("g_variant", 1:n_variant))
#
# G <- replicate(
#   n = n_variant,
#   expr = as.vector(sapply(
#     c(0.01, 0.05), rbinom, n = sample_size / length(c(0.01, 0.05)), size = 2
#   ))
# )
# colnames(G) <- paste0("g_variant", 1:n_variant)
#
# Z <- matrix(
#   data = c(rep(1, n_variant), round(runif(n_variant * 2))),
#   nrow = length(paste0("g_variant", 1:n_variant)),
#   ncol = 3,
#   dimnames = list(paste0("g_variant", 1:n_variant), paste0("cluster", 1:3))
# )
# Z <- cbind(
#   Z,
#   maf = colSums(as.matrix(G[, paste0("g_variant", 1:n_variant), drop = FALSE])) / (nrow(G) * 2),
#   effect = variant_effects
# )
#
# data <- data.frame(
#   y_raw = rnorm(sample_size, 10, 2),
#   y_binary = rep(c(0, 1), each = sample_size / 2),
#   x_cov0 = 1,
#   x_cov1 = runif(sample_size),
#   x_cov2 = rnorm(sample_size, 25, 5)
# )
#
# data[["y_tau"]] <- as.vector(data[["y_raw"]] +
#   as.matrix(G[, paste0("g_variant", 1:n_variant)]) %*% variant_effects)
#
# data[["y_pi"]] <- data[["y_raw"]] + data[["y_binary"]] * 3
#
# data[["y_taupi"]] <- as.vector(
#   data[["y_raw"]] +
#   data[["y_binary"]] * 3 +
#   as.matrix(G[, paste0("g_variant", 1:n_variant)]) %*% variant_effects
# )
#
# mist_data <- list(
#   phenotypes = data,
#   genotypes = G,
#   variants_info = Z
# )
#
#
# usethis::use_data(mist_data, overwrite = TRUE)
"mist_data"
