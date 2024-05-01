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
  it("then services contains 'add' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['add']] |> expect.exist()
  })
  it("then services contains 'retrieve' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['retrieve']] |> expect.exist()
  })
  it("then services contains 'retrieve.where.id' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['retrieve.where.id']] |> expect.exist()
  })
  it("then services contains 'modify' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['modify']] |> expect.exist()
  })
  it("then services contains 'remove' service",{
    # When
    services <- Todo.Service()

    # Then
    services[['remove']] |> expect.exist()
  })
})

describe("When todo |> service[['add']]()",{
  it("then todo is added inserted into memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- 'Task' |> Todo.Model()

    expected.todo <- new.todo
    
    # When
    new.todo |> service[['add']]()

    # Then
    actual.todo <- new.todo[['id']] |> broker[['select.where.Id']]()
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if todo has no id",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- list(
      id     = NULL,
      task   = "Task",
      status = "New"
    )

    # Then
    new.todo |> service[['add']]() |> expect.error()
  })
  it("then an exception is thrown if todo has no task",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- list(
      id     = uuid::UUIDgenerate(),
      task   = NULL,
      status = "New"
    )

    # Then
    new.todo |> service[['add']]() |> expect.error()
  })
  it("then an exception is thrown if todo has no status",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    new.todo <- list(
      id     = uuid::UUIDgenerate(),
      task   = "Task",
      status = NULL
    )

    # Then
    new.todo |> service[['add']]() |> expect.error()
  })
})

describe("When service[['retrieve']]()",{
  it("then all todos are returned from memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['select']]()

    # When
    actual.todos <- service[['retrieve']]()

    # Then
    actual.todos |> expect.equal.data(expected.todos)
  })
})

describe("When id |> service[['retrieve.where.id']]()",{
  it("then todo is returned from memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['select']]()
    expected.todo <- expected.todos |> tail(1)

    id <- expected.todo[['id']]

    # When
    actual.todo <- id |> service[['retrieve.where.id']]()

    # Then
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if id null",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    id <- NULL

    # Then
    id |> service[['retrieve.where.id']]() |> expect.error()
  })
})

describe("When todo |> service[['modify']]()",{
  it("then todo is updated in memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['select']]()
    expected.todo  <- expected.todos |> tail(1)
    expected.todo[['task']] <- "Updated"

    id <- expected.todo[['id']]

    # When
    expected.todo |> service[['modify']]()

    # Then
    actual.todo <- id |> service[['retrieve.where.id']]()
    actual.todo |> expect.equal.data(expected.todo)
  })
  it("then an exception is thrown if todo has no id",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    todo <- list(
      id     = NULL,
      task   = "Task",
      status = "New"
    )

    # Then
    todo |> service[['modify']]() |> expect.error()
  })
  it("then an exception is thrown if todo has not task",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    todo <- list(
      id     = uuid::UUIDgenerate(),
      task   = NULL,
      status = "New"
    )

    # Then
    todo |> service[['modify']]() |> expect.error()
  })
})

describe("When id |> service[['remove']]()",{
  it("then todo is deleted from memory.storage",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    expected.todos <- broker[['select']]()
    expected.todo  <- expected.todos |> tail(1)
    expected.count <- 0

    id <- expected.todo[['id']]

    # When
    id |> service[['remove']]()

    # Then
    actual.todo <- id |> broker[['select.where.Id']]()
    actual.todo |> expect.rows(expected.count)
  })
  it("then an exception is thrown if id null",{
    # Given
    storage <- configuration |> Storage.Orchestrator('memory')

    Todos |> storage[['seed.table']]('Todo')

    broker  <- storage |> Todo.Broker()
    service <- broker |> Todo.Service()

    id <- NULL

    # Then
    id |> service[['remove']]() |> expect.error()
  })
})