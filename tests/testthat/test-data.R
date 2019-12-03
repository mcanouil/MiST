test_that('load data', {
  expect_true({
    data(mist_data)
    exists("mist_data")
  })
})
