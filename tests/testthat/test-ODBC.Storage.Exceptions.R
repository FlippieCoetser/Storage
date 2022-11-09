test_that("ODBC.Storage.Exceptions() should not throw an error",{
    ODBC.Storage.Exceptions() |>
        expect_no_error()
})

test_that("ODBC.Storage.Exceptions() should return a list of exceptions",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include ConfigurationNull exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["ConfigurationNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['ConfigurationNull']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["ConfigurationNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['ConfigurationNull']]() should throw ConfigurationNull error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- 'Configuration provided is null. Provide valid configuration'

    # Then
    TRUE |>
        exception[["ConfigurationNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include ConfigurationMissing exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["ConfigurationMissing"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['ConfigurationMissing']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["ConfigurationMissing"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['ConfigurationMissing']]() should throw ConfigurationMissing error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- 'No configuration provided but required. Provide configuration'

    # Then
    TRUE |>
        exception[["ConfigurationMissing"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include DSNIsNull exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["DSNIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['DSNIsNull']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["DSNIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['DSNIsNull']]() should throw DSNIsNull error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- 'Configuration data frame has no DSN. Add DSN to configuration'

    # Then
    TRUE |>
        exception[["DSNIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include UsernameIsNull exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["UsernameIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['UsernameIsNull']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["UsernameIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['UsernameIsNull']]() should throw UsernameIsNull error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- 'Configuration data frame has no Username. Add Username to configuration'

    # Then
    TRUE |>
        exception[["UsernameIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include PasswordIsNull exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["PasswordIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['PasswordIsNull']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["PasswordIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['PasswordIsNull']]() should throw PasswordIsNull error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- 'Configuration data frame has no Password. Add Password to configuration'

    # Then
    TRUE |>
        exception[["PasswordIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include ServerUnreachable exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["ServerUnreachable"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['ServerUnreachable']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["ServerUnreachable"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['ServerUnreachable']]() should throw ServerUnreachable error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- "TCP Provider: Timeout error, Try again!"

    # Then
    TRUE |>
        exception[["ServerUnreachable"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include DataSourceNotFound exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["DataSourceNotFound"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['DataSourceNotFound']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["DataSourceNotFound"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['DataSourceNotFound']]() should throw DataSourceNotFound error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- "ODBC Driver: DSN Missing, but Required"

    # Then
    TRUE |>
        exception[["DataSourceNotFound"]]() |>
            expect_error(error)
})


test_that("List of exceptions return from ODBC.Storage.Exceptions() should include LoginFailedException exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["LoginFailedException"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['LoginFailedException']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["LoginFailedException"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['LoginFailedException']]() should throw LoginFailedException error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- "ODBC Driver: Login Failed, check credentials"

    # Then
    TRUE |>
        exception[["LoginFailedException"]]() |>
            expect_error(error)
})


test_that("List of exceptions return from ODBC.Storage.Exceptions() should include DuplicateKey exception",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["DuplicateKey"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['DuplicateKey']]() should not throw error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    FALSE |>
        exception[["DuplicateKey"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['DuplicateKey']]() should throw DuplicateKey error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    error <- "SQL Error: Duplicate Id not allowed"

    # Then
    TRUE |>
        exception[["DuplicateKey"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include ConnectionExceptions",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["ConnectionExceptions"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that(" 'test' |> exception[['ConnectionExceptions']]() should not throw an error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    'test' |>
        exception[["ConnectionExceptions"]]()  |>
            expect_no_error()
})

test_that(" '08001' |> exception[['ConnectionExceptions']]() should not throw an error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    '08001' |>
        exception[["ConnectionExceptions"]]()  |>
            expect_error()
})

test_that(" 'IM002' |> exception[['ConnectionExceptions']]() should not throw an error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    'IM002' |>
        exception[["ConnectionExceptions"]]()  |>
            expect_error()
})

test_that(" '28000' |> exception[['ConnectionExceptions']]() should not throw an error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    '28000' |>
        exception[["ConnectionExceptions"]]()  |>
            expect_error()
})

test_that("List of exceptions return from ODBC.Storage.Exceptions() should include QueryExceptions",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    exception[["QueryExceptions"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that(" 'test' |> exception[['QueryExceptions']]() should not throw an error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    'test' |>
        exception[["QueryExceptions"]]()  |>
            expect_no_error()
})

test_that(" '01000' |> exception[['QueryExceptions']]() should not throw an error",{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # Then
    '01000' |>
        exception[["QueryExceptions"]]()  |>
            expect_error()
})