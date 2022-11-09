test_that("Model.Validation.Service() should not throw an error",{
    Model.Validation.Service() |>
        expect_no_error()
})

test_that("Model.Validation.Service() should return a list of validators",{
    # Given
    validators <- Model.Validation.Service()

    # Then
    validators    |> 
        is.list() |> 
            expect_equal(TRUE)
})

test_that("The list of validators returned from Model.Validation.Service() should include TodoExist",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['TodoExist']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Todo |> validate[['TodoExist']]() should not throw error if todo exist",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame()
    
    # Then
    todo |> 
        validate[['TodoExist']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['TodoExist']]() should throw error if todo is null",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- NULL
    error <- "Successfull validation requires a todo dataframe"

    # Then
    todo |> 
        validate[['TodoExist']]() |>
            expect_error(error)
})

test_that("The list of validators returned from Model.Validation.Service() should include HasId",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['HasId']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Todo |> validate[['HasId']]() should not throw error if todo has Id exist",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id = 'Id'
    )
    
    # Then
    todo |> 
        validate[['HasId']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['HasId']]() should throw error if todo has no Id",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame()
    error <- "Todo data frame has no Id"

    # Then
    todo |> 
        validate[['HasId']]() |>
            expect_error(error)
})

test_that("The list of validators returned from Model.Validation.Service() should include HasTask",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['HasTask']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Todo |> validate[['HasTask']]() should not throw error if todo has Task exist",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Task = 'Task'
    )
    
    # Then
    todo |> 
        validate[['HasTask']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['HasTask']]() should throw error if todo has no Task",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame()
    error <- "Todo data frame has no Task"

    # Then
    todo |> 
        validate[['HasTask']]() |>
            expect_error(error)
})

test_that("The list of validators returned from Model.Validation.Service() should include HasStatus",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['HasStatus']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Todo |> validate[['HasStatus']]() should not throw error if todo has Status exist",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Status = 'Status'
    )
    
    # Then
    todo |> 
        validate[['HasStatus']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['HasStatus']]() should throw error if todo has no Status",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame()
    error <- "Todo data frame has no Status"

    # Then
    todo |> 
        validate[['HasStatus']]() |>
            expect_error(error)
})

test_that("The list of validators returned from Model.Validation.Service() should include Todo",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['Todo']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Todo |> validate[['Todo']]() should not throw error if todo exist",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id     = 'Id',
        Task   = 'Task',
        Status = 'Status'
    )
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['Todo']]() should throw error if todo is null",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- NULL
    error <- "Successfull validation requires a todo dataframe"
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_error(error)
})

test_that("Todo |> validate[['Todo']]() should not throw error if todo has Id",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id     = 'Id',
        Task   = 'Task',
        Status = 'Status'
    )
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['Todo']]() should throw error if todo has no Id",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame()
    error <- "Todo data frame has no Id"
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_error(error)
})

test_that("Todo |> validate[['Todo']]() should not throw error if todo has Task",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id     = 'Id',
        Task   = 'Task',
        Status = 'Status'
    )
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['Todo']]() should throw error if todo has no Task",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id = 'Id'
    )
    error <- "Todo data frame has no Task"
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_error(error)
})

test_that("Todo |> validate[['Todo']]() should not throw error if todo has Status",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id     = 'Id',
        Task   = 'Task',
        Status = 'Status'
    )
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_no_error()
})

test_that("Todo |> validate[['Todo']]() should throw error if todo has no Status",{
    # Given
    validate <- Model.Validation.Service()

    todo  <- data.frame(
        Id     = 'Id',
        Task   = 'Task'
    )
    error <- "Todo data frame has no Status"
    
    # Then
    todo |> 
        validate[['Todo']]() |>
            expect_error(error)
})

test_that("The list of validators returned from Model.Validation.Service() should include Id",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['Id']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Id |> validate[['Id']]() should not throw error if id is not null",{
    # Given
    validate <- Model.Validation.Service()

    id <- 'Id'
    
    # Then
    id |> 
        validate[['Id']]() |>
            expect_no_error()
})

test_that("Id |> validate[['Id']]() should throw error if Id is null",{
    # Given
    validate <- Model.Validation.Service()

    id <- NULL
    error <- "Successfull validation requires an Id"
    
    # Then
    id |> 
        validate[['Id']]() |>
            expect_error(error)
})

test_that("The list of validators returned from Model.Validation.Service() should include IsDuplicate",{
    # Given
    validator <- Model.Validation.Service()

    # Then
    validator[['IsDuplicate']] |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Todo |> validate[['IsDuplicate']]() should not throw error if todo does not exsit in todos",{
    # Given
    validate <- Model.Validation.Service()

    todos <- data.frame(
        Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
               '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
               'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
        Task   = c('Task.1','Task.2','Task.3'),
        Status = c('New','New','Done')
    )

    todo  <- data.frame(
        Id     = uuid::UUIDgenerate(),
        Task   = 'Task',
        Status = 'New'
    )
    
    # Then
    todo |> 
        validate[['IsDuplicate']](todos) |>
            expect_no_error()
})

test_that("Todo |> validate[['IsDuplicate']]() should throw error if todo exsit in todos",{
    # Given
    validate <- Model.Validation.Service()

    todos <- data.frame(
        Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
               '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
               'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
        Task   = c('Task.1','Task.2','Task.3'),
        Status = c('New','New','Done')
    )

    todo  <- todos |> head(1)

    error <- 'Duplicate Id not allowed'
    
    # Then
    todo |> 
        validate[['IsDuplicate']](todos) |>
            expect_error(error)
})