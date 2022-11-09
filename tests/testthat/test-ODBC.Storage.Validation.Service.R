test_that("ODBC.Storage.Validation.Service() should not throw an error",{
    ODBC.Storage.Validation.Service() |>
        expect_no_error()
})

test_that("ODBC.Storage.Validation.Service() should return a list of validators",{
    # Given
    validators <- ODBC.Storage.Validation.Service()

    # Then
    validators    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("validate[['Configuration']]() should not error when configuration provided",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration <- list()

  # Then
  configuration |>
    validate[["Configuration"]]() |>
        expect_no_error()
})

test_that("validate[['Configuration']]() should throw error when no configuration provided",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  error <- "No configuration provided but required. Provide configuration"

  # Then
  validate[["Configuration"]]() |>
    expect_error(error)
})

test_that("configuration |> validate[['Configuration']]() should throw error when configuration null",{
  validate <- ODBC.Storage.Validation.Service()

  # Given
  error <- "Configuration provided is null. Provide valid configuration"

  # Then
  NULL |>
    validate[["Configuration"]]() |>
        expect_error(error)
})

test_that("configuration |> validate[['HasDSN']]() should not throw error when configuration contains DSN",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration          <- list()
  configuration[["DSN"]] <- 'DSN' 

  # Then
  configuration |>
    validate[["HasDSN"]]() |>
        expect_no_error()
})

test_that("configuration |> validate[['HasDSN']]() should throw error when configuration contains no DSN",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration <- list()

  error <- 'Configuration data frame has no DSN. Add DSN to configuration'

  # Then
  configuration |>
    validate[["HasDSN"]]() |>
        expect_error(error)
})

test_that("configuration |> validate[['HasUsername']]() should not throw error when configuration contains HasUsername",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration          <- list()
  configuration[["Username"]] <- 'Username' 

  # Then
  configuration |>
    validate[["HasUsername"]]() |>
        expect_no_error()
})

test_that("configuration |> validate[['HasUsername']]() should throw error when configuration contains no HasUsername",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration <- list()

  error <- 'Configuration data frame has no Username. Add Username to configuration'

  # Then
  configuration |>
    validate[["HasUsername"]]() |>
        expect_error(error)
})

test_that("configuration |> validate[['HasPassword']]() should not throw error when configuration contains HasPassword",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration          <- list()
  configuration[["Password"]] <- 'Password' 

  # Then
  configuration |>
    validate[["HasPassword"]]() |>
        expect_no_error()
})

test_that("configuration |> validate[['HasPassword']]() should throw error when configuration contains no HasPassword",{
  # Given
  validate <- ODBC.Storage.Validation.Service()

  configuration <- list()

  error <- 'Configuration data frame has no Password. Add Password to configuration'

  # Then
  configuration |>
    validate[["HasPassword"]]() |>
        expect_error(error)
})