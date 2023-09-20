describe("Todo.Broker",{
  it("Exist",{
    Todo.Broker |> expect.exist()
  })
})

describe("When operations <- storage |> Todo.Broker()",{
  it("then operations is a list",{
    # When
    operations <- Todo.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains Insert operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Insert']] |> expect.exist()
  })
  it("then operations contains Select operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Select']] |> expect.exist()
  })
  it("then operations contains SelectWhereId operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['SelectWhereId']] |> expect.exist()
  })
  it("then operations contains Update operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Update']] |> expect.exist()
  })
  it("then operations contains Delete operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Delete']] |> expect.exist()
  })
})

describe("When todo |> operations[['Insert']]()",{
  it("then todo is inserted into odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configuration |> Storage.Orchestrator('ODBC')
    operations <- storage |> Todo.Broker()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    id <- new.todo[['Id']]

    expected.todo <- new.todo |> as.data.frame()

    # When
    new.todo |> operations[['Insert']]()

    # Then
    actual.todo <- fields |> storage[['SelectWhereId']]('Todo', id)
    actual.todo |> expect.equal(expected.todo)

    id |> storage[['Delete']]('Todo')
  })
  it("then todo is inserted into mock.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('Mock',data)
    operations <- storage |> Todo.Broker()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    id <- new.todo[['Id']]

    expected.todo <- new.todo |> as.data.frame()

    # When
    new.todo |> operations[['Insert']]()

    # Then
    actual.todo <- fields |> storage[['SelectWhereId']]('Todo', id)
    actual.todo |> expect.equal.data(expected.todo)

    id |> storage[['Delete']]('Todo')
  })
})

describe("When operations[['Select']]()",{
  it("then all todos in odbc.storage is returned",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configuration |> Storage.Orchestrator('ODBC')
    operations <- storage |> Todo.Broker()

    expected.todos <- fields |> storage[['Select']]('Todo')

    # When
    actual.todos <- operations[['Select']]()

    # Then
    actual.todos |> expect.equal(expected.todos)
  })
  it("then all todos in mock.storage is returned",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('Mock',data)
    operations <- storage |> Todo.Broker()

    expected.todos <- fields |> storage[['Select']]('Todo')

    # When
    actual.todos <- operations[['Select']]()

    # Then
    actual.todos |> expect.equal(expected.todos)
  })
})

describe("When id |> operations[['SelectWhereId']]()",{
  it("then todo with id equal id is returned from odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configuration |> Storage.Orchestrator('ODBC')
    operations <- storage |> Todo.Broker()

    existing.todos <- fields |> storage[['Select']]('Todo')
    existing.todo  <- existing.todos |> tail(1)
    existing.id    <- existing.todo[['Id']]

    expected.todo <- fields |> storage[['SelectWhereId']]('Todo', existing.id)

    # When
    actual.todo <- existing.id |> operations[['SelectWhereId']]()

    # Then
    actual.todo |> expect.equal(expected.todo)
  })
  it("then todo with id equal id is returned from mock.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('Mock',data)
    operations <- storage |> Todo.Broker()

    existing.todos <- fields |> storage[['Select']]('Todo')
    existing.todo  <- existing.todos |> tail(1)
    existing.id    <- existing.todo[['Id']]

    expected.todo <- fields |> storage[['SelectWhereId']]('Todo', existing.id)

    # When
    actual.todo <- existing.id |> operations[['SelectWhereId']]()

    # Then
    actual.todo |> expect.equal(expected.todo)
  })
})

describe("When todo |> operations[['Update']]()",{
  it("then todo in odbc.storage is updated",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configuration |> Storage.Orchestrator('ODBC')
    operations <- storage |> Todo.Broker()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.todo |> storage[['Insert']]('Todo')

    updated.todo <- new.todo |> as.data.frame()
    updated.todo[['Status']] <- 'Done'

    id <- updated.todo[['Id']]

    expected.todo <- updated.todo

    # When
    updated.todo |> operations[['Update']]()

    # Then
    actual.todo <- fields |> storage[['SelectWhereId']]('Todo', id)
    actual.todo |> expect.equal(expected.todo)

    id |> storage[['Delete']]('Todo')
  })
  it("then todo in mock.storage is updated",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('Mock',data)
    operations <- storage |> Todo.Broker()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.todo |> storage[['Insert']]('Todo')

    updated.todo <- new.todo |> as.data.frame()
    updated.todo[['Status']] <- 'Done'

    id <- updated.todo[['Id']]

    expected.todo <- updated.todo

    # When
    updated.todo |> operations[['Update']]()

    # Then
    actual.todo <- fields |> storage[['SelectWhereId']]('Todo', id)
    actual.todo |> expect.equal.data(expected.todo)

    id |> storage[['Delete']]('Todo')
  })
})

describe("When id |> operations[['Delete']]()",{
  it("then todo with id are removed from odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configuration |> Storage.Orchestrator('ODBC')
    operations <- storage |> Todo.Broker()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.todo |> storage[['Insert']]('Todo')

    id <- new.todo[['Id']]

    expected.count <- 0

    # When
    id |> operations[['Delete']]()

    # Then
    actual.count <- fields |> storage[['SelectWhereId']]('Todo', id) |> nrow()
    actual.count |> expect.equal(expected.count)
  })
  it("then todo with is are removed from mock.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('Mock',data)
    operations <- storage |> Todo.Broker()

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.todo |> storage[['Insert']]('Todo')

    id <- new.todo[['Id']]

    expected.count <- 0

    # When
    id |> operations[['Delete']]()

    # Then
    actual.count <- fields |> storage[['SelectWhereId']]('Todo', id) |> nrow()
    actual.count |> expect.equal(expected.count)
  })
})
