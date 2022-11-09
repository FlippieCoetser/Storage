test_that("Mock.Storage.Service() should not throw error when a valid configuration is provided", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  # Then
  configuration |>
    Mock.Storage.Service() |>
        expect_no_error()
})

test_that("Mock.Storage.Service() should throw error when no configuration provided", {
  # Given
  error <- "No configuration provided but required. Provide configuration"

  # Then
  Mock.Storage.Service() |>
    expect_error(error)
})

test_that("Mock.Storage.Service() should return a list of services", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  services <- configuration |> Mock.Storage.Service()

  # Then
  services |>
    is.list() |>
        expect_equal(TRUE)
})

test_that("List of services returned from Mock.Storage.Service() should includes Todo Select service", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  # Then
  service[['Todo']][['Select']] |>
    is.null() |>
        expect_equal(FALSE)
})

test_that("service[['Todo']][['Select']]() should return a data.frame with zero of many Todos", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  # Then
  service[['Todo']][['Select']]() |>
    is.data.frame() |>
        expect_equal(TRUE)
})

test_that("List of services returned from Mock.Storage.Service() should includes Todo SelectWhereId service", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  # Then
  service[['Todo']][['SelectWhereId']] |>
    is.null() |>
        expect_equal(FALSE)
})

test_that("Id |> service[['Todo']][['SelectWhereId']]() should return todo with matching Id", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()
  todo    <- service[['Todo']][['Select']]() |> head(1)
  id      <- todo[["Id"]]

  # When
  retrieved.todo <- id |> service[['Todo']][['SelectWhereId']]()

  # Then
  retrieved.todo[["Id"]] |>
    expect_equal(id)
  
})

test_that("Id |> service[['Todo']][['SelectWhereId']]() should return empty data.frame if no mathcing todo found", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()
  id      <- uuid::UUIDgenerate()

  # When
  retrieved.todo <- id |> service[['Todo']][['SelectWhereId']]()

  # Then
  retrieved.todo |> 
    nrow() |>
        expect_equal(0)
  
})

test_that("Id |> service[['Todo']][['SelectWhereId']]() should return throw error when Id is null", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()
  id      <- NULL

  error <- 'Successfull validation requires an Id'

  # Then
  id |> 
    service[['Todo']][['SelectWhereId']]() |>
        expect_error(error)
})

test_that("List of services returned from Mock.Storage.Service should include Todo Insert",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  # Then
  service[['Todo']][['Insert']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("Todo |> service[['Todo']][['Insert']]() should add todo to storage ",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task',
    Status = 'New'
  )

  # When
  todo |>
    service[['Todo']][['Insert']]()

  # Then
  todo[["Id"]] |>
    service[['Todo']][['SelectWhereId']]() |>
      expect_equal(todo)
})

test_that("Todo |> service[['Todo']][['Insert']]() should return empty data frame if todo is valid",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task',
    Status = 'New'
  )

  # When
  response <-
    todo |>
      service[['Todo']][['Insert']]()

  # Then
  response |> 
    is.data.frame() |>
      expect_equal(TRUE)

  response |> 
    nrow() |>
      expect_equal(0)
})

test_that("Todo |> service[['Todo']][['Insert']]() should throw error if todo has no Id",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todo <- data.frame(
    Task = 'Task',
    Status = 'New'
  )

  error <- 'Todo data frame has no Id'

  # Then
  todo |>
    service[['Todo']][['Insert']]() |>
      expect_error(error)
})

test_that("Todo |> service[['Todo']][['Insert']]() should throw error if todo has no Task",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Status = 'New'
  )

  error <- 'Todo data frame has no Task'

  # Then
  todo |>
    service[['Todo']][['Insert']]() |>
      expect_error(error)
})

test_that("Todo |> service[['Todo']][['Insert']]() should throw error if todo has no Status",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task'
  )

  error <- 'Todo data frame has no Status'

  # Then
  todo |>
    service[['Todo']][['Insert']]() |>
      expect_error(error)
})

test_that("Todo |> service[['Todo']][['Insert']]() should throw error if todo already exist in storage",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()
  # Given
  validate <- Model.Validation.Service()

  todos <- service[['Todo']][['Select']]()
  todo  <- todos |> head(1)

  error <- 'Duplicate Id not allowed'
  
  # Then
  todo |> 
      service[['Todo']][['Insert']]() |>
          expect_error(error)
})

test_that("List of services returned from Mock.Storage.Service should include Todo Update",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  # Then
  service[['Todo']][['Update']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("Todo |> service[['Todo']][['Update']]() should update matching todo in storage",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  updated.todo <- todo
  updated.todo[['Status']] <- 'Complete'

  # When
  updated.todo |>
      service[['Todo']][['Update']]()

  # Then
  todo[['Id']] |> 
    service[['Todo']][['SelectWhereId']]() |>
      expect_equal(updated.todo)
})

test_that("Todo |> service[['Todo']][['Update']]() should return empty data frame if todo is valid",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  updated.todo <- todo
  updated.todo[['Status']] <- 'Complete'

  # When
  response <-
    updated.todo |>
      service[['Todo']][['Update']]()

  # Then
  response |> 
    is.data.frame() |>
      expect_equal(TRUE)

  response |> 
    nrow() |>
      expect_equal(0)
})

test_that("Todo |> service[['Todo']][['Update']]() should throw error if todo has no Id",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  invalid.todo <- data.frame(
    Task = todo[['Task']],
    Status = todo[['Status']]
  )

  error <- 'Todo data frame has no Id'

  # Then
  invalid.todo |>
    service[['Todo']][['Update']]() |>
      expect_error(error)
})

test_that("Todo |> service[['Todo']][['Update']]() should throw error if todo has no Task",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  invalid.todo <- data.frame(
    Id = todo[['Id']],
    Status = todo[['Status']]
  )

  error <- 'Todo data frame has no Task'

  # Then
  invalid.todo |>
    service[['Todo']][['Update']]() |>
      expect_error(error)
})

test_that("Todo |> service[['Todo']][['Update']]() should throw error if todo has no Status",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  invalid.todo <- data.frame(
    Id = todo[['Id']],
    Task = todo[['Task']]
  )

  error <- 'Todo data frame has no Status'

  # Then
  invalid.todo |>
    service[['Todo']][['Update']]() |>
      expect_error(error)
})

test_that("List of services returned from Mock.Storage.Service should include Todo Delete",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  # Then
  service[['Todo']][['Delete']] |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("Id |> service[['Todo']][['Delete']]() should delete todo with matching Id from storage",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> tail(1)

  deleted.todo <- todo

  # When
  deleted.todo[['Id']] |>
      service[['Todo']][['Delete']]()

  # Then
  deleted.todo[['Id']] |> 
    service[['Todo']][['SelectWhereId']]() |>
      nrow() |>
      expect_equal(0)
})

test_that("Id |> service[['Todo']][['Delete']]() should return empty data frame if id is valid",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()

  todos   <- service[['Todo']][['Select']]()
  todo    <- todos |> tail(1)

  deleted.todo <- todo

  # When
  response <- deleted.todo[['Id']] |>
      service[['Todo']][['Delete']]()

  # Then
  response |> 
    is.data.frame() |>
      expect_equal(TRUE)

  response |> 
    nrow() |>
      expect_equal(0)
})

test_that("Id |> service[['Todo']][['Delete']]() should throw error if Id is null",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  service <- configuration |> Mock.Storage.Service()
  
  error <- 'Successfull validation requires an Id'

  # Then
  NULL |>
    service[['Todo']][['Delete']]() |>
      expect_error(error)
})