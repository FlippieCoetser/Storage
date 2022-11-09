test_that("Mock.Storage.Exceptions() should not throw an error",{
    Mock.Storage.Exceptions() |>
        expect_no_error()
})

test_that("Mock.Storage.Exceptions() should return a list of exceptions",{
    # Given
    exceptions <- Mock.Storage.Exceptions()

    # Then
    exceptions    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("List of exceptions return from Model.Exceptions() should include ConfigurationNull exceptions",{
    # Given
    exception <- Mock.Storage.Exceptions()

    # Then
    exception[["ConfigurationNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['ConfigurationNull']]() should not throw error",{
    # Given
    exception <- Mock.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["ConfigurationNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['ConfigurationNull']]() should throw ConfigurationNull error",{
    # Given
    exception <- Mock.Storage.Exceptions()

    error <- 'Configuration provided is null. Provide valid configuration'

    # Then
    TRUE |>
        exception[["ConfigurationNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from Model.Exceptions() should include ConfigurationMissing exceptions",{
    # Given
    exception <- Mock.Storage.Exceptions()

    # Then
    exception[["ConfigurationMissing"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['ConfigurationMissing']]() should not throw error",{
    # Given
    exception <- Mock.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["ConfigurationMissing"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['ConfigurationMissing']]() should throw ConfigurationMissing error",{
    # Given
    exception <- Mock.Storage.Exceptions()

    error <- 'No configuration provided but required. Provide configuration'

    # Then
    TRUE |>
        exception[["ConfigurationMissing"]]() |>
            expect_error(error)
})