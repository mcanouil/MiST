test_that("conflicts", {
  expect_s3_class(mist_conflicts(), "mist_conflicts")
})

test_that("conflicts", {
  expect_true(is.null(print.mist_conflicts(mist_conflicts())))
})
