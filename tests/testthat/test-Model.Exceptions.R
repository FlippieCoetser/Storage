test_that("Model.Exceptions() should not throw an error",{
    Model.Exceptions() |>
        expect_no_error()
})

test_that("Configuration.Exceptions() should return a list of exceptions",{
    # Given
    exceptions <- Model.Exceptions()

    # Then
    exceptions    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("List of exceptions return from Model.Exceptions() should include TodoIsNull exceptions",{
    # Given
    exception <- Model.Exceptions()

    # Then
    exception[["TodoIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['TodoIsNull']]() should not throw error",{
    # Given
    exception <- Model.Exceptions()

    # Then
    FALSE |>
        exception[["TodoIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['TodoIsNull']]() should throw TodoIsNull error",{
    # Given
    exception <- Model.Exceptions()

    error <- 'Successfull validation requires a todo dataframe'

    # Then
    TRUE |>
        exception[["TodoIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from Model.Exceptions() should include IdIsNull exceptions",{
    # Given
    exception <- Model.Exceptions()

    # Then
    exception[["IdIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['IdIsNull']]() should not throw error",{
    # Given
    exception <- Model.Exceptions()

    # Then
    FALSE |>
        exception[["IdIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['IdIsNull']]() should throw IdIsNull error",{
    # Given
    exception <- Model.Exceptions()

    error <- 'Todo data frame has no Id'

    # Then
    TRUE |>
        exception[["IdIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from Model.Exceptions() should include TaskIsNull exceptions",{
    # Given
    exception <- Model.Exceptions()

    # Then
    exception[["TaskIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['TaskIsNull']]() should not throw error",{
    # Given
    exception <- Model.Exceptions()

    # Then
    FALSE |>
        exception[["TaskIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['TaskIsNull']]() should throw TaskIsNull error",{
    # Given
    exception <- Model.Exceptions()

    error <- 'Todo data frame has no Task'

    # Then
    TRUE |>
        exception[["TaskIsNull"]]() |>
            expect_error(error)
})

test_that("List of exceptions return from Model.Exceptions() should include StatusIsNull exceptions",{
    # Given
    exception <- Model.Exceptions()

    # Then
    exception[["StatusIsNull"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['StatusIsNull']]() should not throw error",{
    # Given
    exception <- Model.Exceptions()

    # Then
    FALSE |>
        exception[["StatusIsNull"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['StatusIsNull']]() should throw StatusIsNull error",{
    # Given
    exception <- Model.Exceptions()

    error <- 'Todo data frame has no Status'

    # Then
    TRUE |>
        exception[["StatusIsNull"]]() |>
            expect_error(error)
})


test_that("List of exceptions return from Model.Exceptions() should include NoId exception",{
    # Given
    exception <- Model.Exceptions()

    # Then
    exception[["NoId"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['NoId']]() should not throw error",{
    # Given
    exception <- Model.Exceptions()

    # Then
    FALSE |>
        exception[["NoId"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['NoId']]() should throw NoId error",{
    # Given
    exception <- Model.Exceptions()

    error <- 'Successfull validation requires an Id'

    # Then
    TRUE |>
        exception[["NoId"]]() |>
            expect_error(error)
})


test_that("List of exceptions return from Model.Exceptions() should include DuplicateKey exceptions",{
    # Given
    exception <- Model.Exceptions()

    # Then
    exception[["DuplicateKey"]]  |>
        is.null()             |>
            expect_equal(FALSE)
})

test_that("FALSE |> exception[['DuplicateKey']]() should not throw error",{
    # Given
    exception <- Model.Exceptions()

    # Then
    FALSE |>
        exception[["DuplicateKey"]]() |>
            expect_no_error()
})

test_that("TRUE |> exception[['DuplicateKey']]() should throw DuplicateKey error",{
    # Given
    exception <- Model.Exceptions()

    error <- 'Duplicate Id not allowed'

    # Then
    TRUE |>
        exception[["DuplicateKey"]]() |>
            expect_error(error)
})