test_that("Mock.Storage.Validation.Service() should not throw an error",{
    Mock.Storage.Validation.Service() |>
        expect_no_error()
})

test_that("Mock.Storage.Validation.Service() should return a list of exceptions",{
    # Given
    validators <- Mock.Storage.Validation.Service()

    # Then
    validators    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("validate[['Configuration']]() should throw error when no configuration provided",{
  # Given
  validate <- Mock.Storage.Validation.Service()

  error <- "No configuration provided but required. Provide configuration"

  # Then
  validate[["Configuration"]]() |>
    expect_error(error)
})

test_that("configuration |> validate[['Configuration']]() should throw error when configuration null",{
  validate <- Mock.Storage.Validation.Service()

  # Given
  error <- "Configuration provided is null. Provide valid configuration"

  # Then
  NULL |>
    validate[["Configuration"]]() |>
        expect_error(error)
})