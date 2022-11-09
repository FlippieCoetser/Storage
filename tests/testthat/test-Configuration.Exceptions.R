test_that("Configuration.Exceptions() should not throw an error",{
    Configuration.Exceptions() |>
        expect_no_error()
})

test_that("Configuration.Exceptions() should return a list of exceptions",{
    # Given
    exceptions <- Configuration.Exceptions()

    # Then
    exceptions    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("List of exceptions return from Configuration.Exceptions() should include DSNIsNull exceptions",{
    # Given
    exception <- Configuration.Exceptions()

    # Then
    exception[["DSNIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['DSNIsNull']]() should not throw error",{
    # Given
    exception <- Configuration.Exceptions()

    # Then
    FALSE |>
        exception[["DSNIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['DSNIsNull']]() should throw DSNIsNull error",{
    # Given
    exception <- Configuration.Exceptions()

    error <- 'Configuration has no DSN'

    # Then
    TRUE |>
        exception[["DSNIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from Configuration.Exceptions() should include UsernameIsNull exceptions",{
    # Given
    exception <- Configuration.Exceptions()

    # Then
    exception[["UsernameIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['UsernameIsNull']]() should not throw error",{
    # Given
    exception <- Configuration.Exceptions()

    # Then
    FALSE |>
        exception[["UsernameIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['UsernameIsNull']]() should throw UsernameIsNull error",{
    # Given
    exception <- Configuration.Exceptions()

    error <- 'Configuration has no Username'

    # Then
    TRUE |>
        exception[["UsernameIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from Configuration.Exceptions() should include PasswordIsNull exceptions",{
    # Given
    exception <- Configuration.Exceptions()

    # Then
    exception[["PasswordIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['PasswordIsNull']]() should not throw error",{
    # Given
    exception <- Configuration.Exceptions()

    # Then
    FALSE |>
        exception[["PasswordIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['PasswordIsNull']]() should throw PasswordIsNull error",{
    # Given
    exception <- Configuration.Exceptions()

    error <- 'Configuration has no Password'

    # Then
    TRUE |>
        exception[["PasswordIsNull"]]() |>
            expect_error(error)
})