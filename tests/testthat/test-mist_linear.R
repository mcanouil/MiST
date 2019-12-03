data(mist_data)
attach(mist_data)

for (imethod in c("liu", "davies")) {

  test_that(paste('linear', imethod, 'model error'), {
    expect_error({
      mist(
        y = phenotypes[, "y_taupi"],
        X = phenotypes[, paste0("x_cov", 0:2)],
        G = genotypes,
        Z = variants_info[, 1, drop = FALSE],
        method = imethod,
        model = "something"
      )
    })
  })

  test_that(paste('linear', imethod, 'y error'), {
    expect_error({
      mist(
        y = as.matrix(phenotypes[, "y_taupi"]),
        X = phenotypes[, paste0("x_cov", 0:2)],
        G = genotypes,
        Z = variants_info[, 1, drop = FALSE],
        method = imethod
      )
    })
  })

  test_that(paste('linear', imethod, 'X error'), {
    expect_error({
      mist(
        y = phenotypes[, "y_taupi"],
        X = as.data.frame(phenotypes[, paste0("x_cov", 0:2)]),
        G = genotypes,
        Z = variants_info[, 1, drop = FALSE],
        method = imethod
      )
    })
  })

  test_that(paste('linear', imethod, 'G error'), {
    expect_error({
      mist(
        y = phenotypes[, "y_taupi"],
        X = phenotypes[, paste0("x_cov", 0:2)],
        G = as.data.frame(genotypes),
        Z = variants_info[, 1, drop = FALSE],
        method = imethod
      )
    })
  })

  test_that(paste('linear', imethod, 'Z error'), {
    expect_error({
      mist(
        y = phenotypes[, "y_taupi"],
        X = phenotypes[, paste0("x_cov", 0:2)],
        G = genotypes,
        Z = as.data.frame(variants_info[, 1, drop = FALSE]),
        method = imethod
      )
    })
  })

  test_that(paste('linear', imethod, 'guess'), {
    expect_s3_class(
      object = {mist(
          y = phenotypes[, "y_taupi"],
          X = phenotypes[, paste0("x_cov", 0:2)],
          G = genotypes,
          Z = variants_info[, 1, drop = FALSE],
          method = imethod
      )},
      class = "mist"
    )
  })

  test_that(paste('linear', imethod, 'binary'), {
    expect_warning({
      try({mist(
          y = phenotypes[, "y_taupi"],
          X = phenotypes[, paste0("x_cov", 0:2)],
          G = genotypes,
          Z = variants_info[, 1, drop = FALSE],
          method = imethod,
          model = "binary"
      )}, silent = TRUE)
    })
  })

  test_that(paste('linear', imethod, 'continuous'), {
    expect_s3_class(
      object = {mist(
          y = phenotypes[, "y_taupi"],
          X = phenotypes[, paste0("x_cov", 0:2)],
          G = genotypes,
          Z = variants_info[, 1, drop = FALSE],
          method = imethod,
          model = "continuous"
      )},
      class = "mist"
    )
  })

  test_that(paste('linear', imethod, 'weigth'), {
    expect_s3_class(
      object = {mist(
          y = phenotypes[, "y_taupi"],
          X = phenotypes[, paste0("x_cov", 0:2)],
          G = genotypes,
          Z = variants_info[, 1, drop = FALSE],
          method = imethod,
          weight.beta = c(1, 25),
          maf = variants_info[, "maf"]
      )},
      class = "mist"
    )
  })

  test_that(paste('linear', imethod, 'weigth with no beta'), {
    expect_warning(
      object = {mist(
          y = phenotypes[, "y_taupi"],
          X = phenotypes[, paste0("x_cov", 0:2)],
          G = genotypes,
          Z = variants_info[, 1, drop = FALSE],
          method = imethod,
          maf = variants_info[, "maf"]
      )},
      class = "mist"
    )
  })

  test_that(paste('linear', imethod, 'weigth with no maf'), {
    expect_warning(
      object = {mist(
          y = phenotypes[, "y_taupi"],
          X = phenotypes[, paste0("x_cov", 0:2)],
          G = genotypes,
          Z = variants_info[, 1, drop = FALSE],
          method = imethod,
          weight.beta = c(1, 25)
      )},
      class = "mist"
    )
  })

}
