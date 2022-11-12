test_that("Mock.Storage.Broker exist",{
    Mock.Storage.Broker |>
        is.null() |>
            expect_equal(FALSE)
})

test_that("Mock.Storage.Broker() return list of bokers",{
    Mock.Storage.Broker() |>
        is.list() |>
            expect_equal(TRUE)
})

test_that("Todo |> broker[['Todo']][['Insert']]() should add todo to storage ",{
  # Given
  broker <- Mock.Storage.Broker()

  todo <- data.frame(
    Id = uuid::UUIDgenerate(),
    Task = 'Task',
    Status = 'New'
  )

  # When
  todo |>
    broker[['Todo']][['Insert']]()

  # Then
  todo[["Id"]] |>
    broker[['Todo']][['SelectWhereId']]() |>
      expect_equal(todo)
})

test_that("Id |> broker[['Todo']][['Select']]() should return list of todos", {
  # Given
  broker  <- Mock.Storage.Broker()

  # When
  todos <- broker[['Todo']][['Select']]()

  # Then
  todos |>
    is.list() |>
     expect_equal(TRUE)

})

test_that("Id |> broker[['Todo']][['SelectWhereId']]() should return todo with matching Id", {
  # Given
  broker  <- Mock.Storage.Broker()

  todo    <- broker[['Todo']][['Select']]() |> head(1)
  id      <- todo[["Id"]]

  # When
  retrieved.todo <- id |> broker[['Todo']][['SelectWhereId']]()

  # Then
  retrieved.todo[["Id"]] |>
    expect_equal(id)

})

test_that("Todo |> broker[['Todo']][['Update']]() should update matching todo in storage",{
  # Given
  broker  <- Mock.Storage.Broker()

  todos   <- broker[['Todo']][['Select']]()
  todo    <- todos |> head(1)

  updated.todo <- todo
  updated.todo[['Status']] <- 'Complete'

  # When
  updated.todo |>
      broker[['Todo']][['Update']]()

  # Then
  todo[['Id']] |>
    broker[['Todo']][['SelectWhereId']]() |>
      expect_equal(updated.todo)
})

test_that("Id |> broker[['Todo']][['Delete']]() should delete todo with matching Id from storage",{
  # Given
  broker  <- Mock.Storage.Broker()

  todos   <- broker[['Todo']][['Select']]()
  todo    <- todos |> tail(1)

  deleted.todo <- todo

  # When
  deleted.todo[['Id']] |>
    broker[['Todo']][['Delete']]()

  # Then
  deleted.todo[['Id']] |>
    broker[['Todo']][['SelectWhereId']]() |>
      nrow() |>
      expect_equal(0)
})
