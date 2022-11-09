test_that("broker[['GetODBCConfiguration']]() should return configuration",{
    # Given
    broker <- Configuration.Broker()

    configuration <- broker[['GetODBCConfiguration']]()

    # Then
    configuration |>
        is.null() |>
            expect_equal(FALSE)
})
test_that("broker[['OpenConfigurationFile']]() should not throw an error.",{
    # Given
    broker <- Configuration.Broker()

    # Then
    broker[['OpenConfigurationFile']]() |>
        expect_no_error()
})