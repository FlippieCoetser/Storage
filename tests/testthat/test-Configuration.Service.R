test_that("Configuration.Utility.Service() should not throw an error.",{
    # Then
    Configuration.Service() |>
        expect_no_error()
})
test_that("configurator[['GetODBCConfiguration']]() should return configuration.",{
    # Given
    configurator <- Configuration.Service()

    # Then
    configurator[["GetODBCConfiguration"]]() |>
        is.null() |>
            expect_equal(FALSE)
})
test_that("configurator[['OpenConfigurationFile']]() should not throw error.",{
    # Given
    configurator <- Configuration.Service()

    # Then
    configurator[["OpenConfigurationFile"]]() |>
        expect_no_error()
})