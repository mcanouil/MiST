data(mist_data)
attach(mist_data)

test_that('mist_print', {
  expect_output({
    print.mist(mist(
      y = phenotypes[, "y_taupi"],
      X = phenotypes[, paste0("x_cov", 0:2)],
      G = genotypes,
      Z = variants_info[, 1, drop = FALSE]
    ))
  })
})
