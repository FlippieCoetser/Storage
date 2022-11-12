test_that("Mock.Storage.Broker exist",{
  # Given
  ODBC.Storage.Broker |>
    is.null() |>
      expect_equal(FALSE)
})

test_that("Mock.Storage.Broker() return list of bokers",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  # Then
  configuration |>
    ODBC.Storage.Broker() |>
      is.list() |>
        expect_equal(TRUE)
})

test_that("Todo |> broker[['Todo']][['Insert']]() should add todo to storage ",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  broker <- configuration |> ODBC.Storage.Broker()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task',
    Status = 'New'
  )

  # When
  todo |> broker[['Todo']][['Insert']]()

  # Then
  todo[["Id"]] |>
    broker[['Todo']][['SelectWhereId']]() |>
      expect_equal(todo)
})

test_that("Id |> broker[['Todo']][['Select']]() should return list of todos", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  broker <- configuration |> ODBC.Storage.Broker()

  # When
  todos <- broker[['Todo']][['Select']]()

  # Then
  todos |>
    is.data.frame() |>
     expect_equal(TRUE)

})

test_that("Id |> broker[['Todo']][['SelectWhereId']]() should return todo with matching Id", {
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  broker <- configuration |> ODBC.Storage.Broker()

  todo    <- broker[['Todo']][['Select']]() |> head(1)
  id      <- todo[["Id"]]

  # Then
  id |>
    broker[['Todo']][['SelectWhereId']]() |>
        expect_equal(todo)

})

test_that("Todo |> broker[['Todo']][['Update']]() should update matching todo in storage",{
  # Given
  configurator <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  broker <- configuration |> ODBC.Storage.Broker()

  todos   <- broker[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  todo[['Status']] <- 'Complete'

  # When
  todo |>
      broker[['Todo']][['Update']]()

  # Then
  todo[['Id']] |>
    broker[['Todo']][['SelectWhereId']]() |>
      expect_equal(todo)
})

test_that("Id |> broker[['Todo']][['Delete']]() should delete todo with matching Id from storage",{
  # Given
  configurator  <- Configuration.Service()
  configuration <- configurator[["GetODBCConfiguration"]]()

  broker <- configuration |> ODBC.Storage.Broker()

  todos  <- broker[['Todo']][['Select']]()
  todo   <- todos |> tail(1)

  # When
  todo[['Id']] |>
    broker[['Todo']][['Delete']]()

  # Then
  todo[['Id']] |>
    broker[['Todo']][['SelectWhereId']]() |>
      nrow() |>
        expect_equal(0)
})
