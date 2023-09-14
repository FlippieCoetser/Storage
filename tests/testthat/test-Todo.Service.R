describe("Todo.Service",{
  it("Exist",{
    Todo.Service |> expect.exist()
  })
})

describe("When services <- Todo.Service()",{
  it("then services is a list",{
    # When
    storage <- configuration |> Mock.Storage.Broker()
    services <- Todo.Service()

    # Then
    services |> expect.list()
  })
  it("then services contains Insert service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Insert']] |> expect.exist()
  })
  it("then services contains Select service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Select']] |> expect.exist()
  })
  it("then services contains SelectWhereId service",{
    # When
    services <- Todo.Service()

    # Then
    services[['SelectWhereId']] |> expect.exist()
  })
  it("then services contains Update service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Update']] |> expect.exist()
  })
  it("then services contains Delete service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Delete']] |> expect.exist()
  })
})

describe("When todo |> service[['Insert']]()",{
  it("then todo is added inserted into mock.storage",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    new.todo <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = "Task",
      Status = "New"
    )

    expected.todo <- new.todo
    
    # When
    new.todo |> service[['Insert']]()

    # Then
    actual.todo <- new.todo[['Id']] |> broker[['SelectWhereId']]()
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if todo has no Id",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    new.todo <- list(
      Id     = NULL,
      Task   = "Task",
      Status = "New"
    )

    # Then
    new.todo |> service[['Insert']]() |> expect.error()
  })
  it("then an exception is thrown if todo has no Task",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = NULL,
      Status = "New"
    )

    # Then
    new.todo |> service[['Insert']]() |> expect.error()
  })
  it("then an exception is thrown if todo has no Status",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = "Task",
      Status = NULL
    )

    # Then
    new.todo |> service[['Insert']]() |> expect.error()
  })
})

describe("When service[['Select']]()",{
  it("then all todos are returned from mock.storage",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()

    # When
    actual.todos <- service[['Select']]()

    # Then
    actual.todos |> expect.equal.data(expected.todos)
  })
})

describe("When id |> service[['SelectWhereId']]()",{
  it("then todo is returned from mock.storage",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()
    expected.todo <- expected.todos |> tail(1)

    id <- expected.todo[['Id']]

    # When
    actual.todo <- id |> service[['SelectWhereId']]()

    # Then
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if Id null",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    id <- NULL

    # Then
    id |> service[['SelectWhereId']]() |> expect.error()
  })
})

describe("When todo |> service[['Update']]()",{
  it("then todo is updated in mock.storage",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()
    expected.todo  <- expected.todos |> tail(1)
    expected.todo[['Task']] <- "Updated"

    id <- expected.todo[['Id']]

    # When
    expected.todo |> service[['Update']]()

    # Then
    actual.todo <- id |> service[['SelectWhereId']]()
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if todo has no Id",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    todo <- list(
      Id     = NULL,
      Task   = "Task",
      Status = "New"
    )

    # Then
    todo |> service[['Update']]() |> expect.error()
  })
  it("then an exception is thrown if todo has not Task",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = NULL,
      Status = "New"
    )

    # Then
    todo |> service[['Update']]() |> expect.error()
  })
})

describe("When id |> service[['Delete']]()",{
  it("then todo is deleted from mock.storage",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()
    expected.todo  <- expected.todos |> tail(1)
    expected.count <- 0

    id <- expected.todo[['Id']]

    # When
    id |> service[['Delete']]()

    # Then
    actual.todo <- id |> broker[['SelectWhereId']]()
    actual.todo |> expect.rows(expected.count)
  })
  it("then an exception is thrown if Id null",{
    # Given
    broker  <- 
      configuration |> 
      Mock.Storage.Broker(data) |>
      Storage.Service() |>
      Todo.Broker()

    service <- broker |> Todo.Service()

    id <- NULL

    # Then
    id |> service[['Delete']]() |> expect.error()
  })
})