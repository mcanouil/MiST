# MiSTr 1.0.2

- Fix URLs in `DESCRIPTION`.
- Minor code changes.
- Remove "conflicts" code.

# MiSTr 1.0.1

## Minor dependency changes

- Update Minimal R version to R 3.4.

# MiSTr 1.0.0

## Major improvements and fixes

- Global rewrite `linear.test` and `linear.weight.test` as one function (`mist_linear`) with less code redundancy.
- Global rewrite `logit.test` and `logit.weight.test` as one function (`mist_logit`) with less code redundancy.
- New `mist` general function to compute either logistic or linear regression in a unified framework.
- New S3 `print` method for `mist`object.
- New `mist_data` (simulated dataset).
- New vignette `MiST` with a comprehensive list of examples using `mist_data`
- Add unit testing.
