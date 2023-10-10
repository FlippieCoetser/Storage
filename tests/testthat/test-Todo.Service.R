describe('Todo.Service',{
  it('Exist',{
    Todo.Service |> expect.exist()
  })
})

describe("When services <- Todo.Service()",{
  it("then services is a list",{
    # When
    services <- Todo.Service()

    # Then
    services |> expect.list()
  })
  it("then services contains 'Add' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Add']] |> expect.exist()
  })
  it("then services contains 'Retrieve' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Retrieve']] |> expect.exist()
  })
  it("then services contains 'RetrieveWhereId' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['RetrieveWhereId']] |> expect.exist()
  })
  it("then services contains 'Modify' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Modify']] |> expect.exist()
  })
  it("then services contains 'Remove' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['Remove']] |> expect.exist()
  })
})

describe("When todo |> service[['Add']]()",{
  it("then todo is added inserted into memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- 'Task' |> Todo()

    expected.todo <- new.todo
    
    # When
    new.todo |> service[['Add']]()

    # Then
    actual.todo <- new.todo[['id']] |> broker[['SelectWhereId']]()
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if todo has no id",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- list(
      id     = NULL,
      task   = "Task",
      status = "New"
    )

    # Then
    new.todo |> service[['Add']]() |> expect.error()
  })
  it("then an exception is thrown if todo has no task",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- list(
      id     = uuid::UUIDgenerate(),
      task   = NULL,
      status = "New"
    )

    # Then
    new.todo |> service[['Add']]() |> expect.error()
  })
  it("then an exception is thrown if todo has no status",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- list(
      id     = uuid::UUIDgenerate(),
      task   = "Task",
      status = NULL
    )

    # Then
    new.todo |> service[['Add']]() |> expect.error()
  })
})

describe("When service[['Retrieve']]()",{
  it("then all todos are returned from memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()

    # When
    actual.todos <- service[['Retrieve']]()

    # Then
    actual.todos |> expect.equal.data(expected.todos)
  })
})

describe("When id |> service[['RetrieveWhereId']]()",{
  it("then todo is returned from memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()
    expected.todo <- expected.todos |> tail(1)

    id <- expected.todo[['id']]

    # When
    actual.todo <- id |> service[['RetrieveWhereId']]()

    # Then
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if id null",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    id <- NULL

    # Then
    id |> service[['RetrieveWhereId']]() |> expect.error()
  })
})

describe("When todo |> service[['Modify']]()",{
  it("then todo is updated in memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()
    expected.todo  <- expected.todos |> tail(1)
    expected.todo[['task']] <- "Updated"

    id <- expected.todo[['id']]

    # When
    expected.todo |> service[['Modify']]()

    # Then
    actual.todo <- id |> service[['RetrieveWhereId']]()
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if todo has no id",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    todo <- list(
      id     = NULL,
      task   = "Task",
      status = "New"
    )

    # Then
    todo |> service[['Modify']]() |> expect.error()
  })
  it("then an exception is thrown if todo has not task",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    todo <- list(
      id     = uuid::UUIDgenerate(),
      task   = NULL,
      status = "New"
    )

    # Then
    todo |> service[['Modify']]() |> expect.error()
  })
})

describe("When id |> service[['Remove']]()",{
  it("then todo is deleted from memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['Select']]()
    expected.todo  <- expected.todos |> tail(1)
    expected.count <- 0

    id <- expected.todo[['id']]

    # When
    id |> service[['Remove']]()

    # Then
    actual.todo <- id |> broker[['SelectWhereId']]()
    actual.todo |> expect.rows(expected.count)
  })
  it("then an exception is thrown if id null",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    id <- NULL

    # Then
    id |> service[['Remove']]() |> expect.error()
  })
})