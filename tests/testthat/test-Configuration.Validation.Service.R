test_that("Configuration.Validation.Service() should return list of validators",{
    # Given
    validators <- Configuration.Validation.Service()
    
    # Then
    validators      |>
        is.list()   |>
            expect_equal(TRUE)
})

test_that("The list of validators returned after Configuration.Validation.Service() should contain a HasDSN validator",{
    # Given
    validator <- Configuration.Validation.Service()

    # Then
    validator[["HasDSN"]] |>
        is.null()         |>
            expect_equal(FALSE)
})

test_that("configuration |> validate[['HasDSN']]() should not throw an error when configuration has a DSN",{
    # Given
    validate <- Configuration.Validation.Service()

    configuration          <- list()
    configuration[['DSN']] <- 'DSN'

    # Then
    configuration              |>
        validate[["HasDSN"]]() |>
            expect_no_error()
})

test_that("configuration |> validate[['HasDSN']]() should throw error when configuration has no DSN",{
    # Given
    validate <- Configuration.Validation.Service()

    error <- 'Configuration has no DSN'

    configuration          <- list()
    configuration[['DSN']] <- NULL

    # Then
    configuration              |>
        validate[["HasDSN"]]() |>
            expect_error(error)
})

test_that("The list of validators returned after Configuration.Validation.Service() should contain a HasUsername validator",{
    # Given
    validator <- Configuration.Validation.Service()

    # Then
    validator[["HasUsername"]] |>
        is.null()              |>
            expect_equal(FALSE)
})

test_that("configuration |> validate[['HasUsername']]() should not throw an error when configuration has a Username",{
    # Given
    validate <- Configuration.Validation.Service()

    configuration               <- list()
    configuration[['Username']] <- 'Username'

    # Then
    configuration                   |>
        validate[["HasUsername"]]() |>
            expect_no_error()
})

test_that("configuration |> validate[['HasUsername']]() should throw error when configuration has no Username",{
    # Given
    validate <- Configuration.Validation.Service()

    error <- 'Configuration has no Username'

    configuration               <- list()
    configuration[['Username']] <- NULL

    # Then
    configuration                   |>
        validate[["HasUsername"]]() |>
            expect_error(error)
})

test_that("The list of validators returned after Configuration.Validation.Service() should contain a HasPassword validator",{
    # Given
    validate <- Configuration.Validation.Service()

    # Then
    validate[["HasPassword"]] |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("configuration |> validate[['HasPassword']]() should not throw an error when configuration has a Password",{
    # Given
    validate <- Configuration.Validation.Service()

    configuration               <- list()
    configuration[['Password']] <- 'Password'

    # Then
    configuration                   |>
        validate[["HasPassword"]]() |>
            expect_no_error()
})

test_that("configuration |> validate[['HasPassword']]() should throw error when configuration has no Password",{
    # Given
    validate <- Configuration.Validation.Service()

    error <- 'Configuration has no Password'

    configuration               <- list()
    configuration[['Password']] <- NULL

    # Then
    configuration                   |>
        validate[["HasPassword"]]() |>
            expect_error(error)
})

test_that("Configuration.Validation.Service() return list that has a ODBCConfiguration validator",{
    # Given
    validate <- Configuration.Validation.Service()

    # Then
    validate[["ODBCConfiguration"]] |>
        is.null()                   |>
            expect_equal(FALSE)
})

test_that("configuration |> validate[['ODBCConfiguration']]() should return configuration",{
    # Given
    validate <- Configuration.Validation.Service()

    configuration               <- list()
    configuration[['DSN']]      <- 'DSN'
    configuration[['Username']] <- 'Username'
    configuration[['Password']] <- 'Password'

    # Then
    configuration                         |>
        validate[["ODBCConfiguration"]]() |>
            expect_equal(configuration)
})

test_that("configuration |> validate[['ODBCConfiguration']]() should throw error when configuration has no DSN",{
    # Given
    validate <- Configuration.Validation.Service()

    error <- 'Configuration has no DSN'

    configuration               <- list()
    configuration[['DSN']]      <- NULL
    configuration[['Username']] <- 'Username'
    configuration[['Password']] <- 'Password'
    
    # Then
    configuration                         |>
        validate[["ODBCConfiguration"]]() |>
            expect_error(error)         
})

test_that("configuration |> validate[['ODBCConfiguration']]() should throw error when configuration has no Username",{
    # Given
    validate <- Configuration.Validation.Service()

    error <- 'Configuration has no Username'

    configuration               <- list()
    configuration[['DSN']]      <- 'DSN'
    configuration[['Username']] <- NULL
    configuration[['Password']] <- 'Password'

    # Then
    configuration                         |>
        validate[["ODBCConfiguration"]]() |>
            expect_error(error)         
})

test_that("configuration |> validate[['ODBCConfiguration']]() should throw error when configuration has no Password",{
    # Given
    validate <- Configuration.Validation.Service()

    error <- 'Configuration has no Password'

    configuration               <- list()
    configuration[['DSN']]      <- 'DSN'
    configuration[['Username']] <- 'Username'
    configuration[['Password']] <- NULL

    # Then
    configuration                         |>
        validate[["ODBCConfiguration"]]() |>
            expect_error(error)         
})