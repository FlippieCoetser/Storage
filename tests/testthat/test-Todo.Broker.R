describe('Todo.Broker',{
  it('Exist',{
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
  it("then operations contains 'insert' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['insert']] |> expect.exist()
  })
  it("then operations contains 'select' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['select']] |> expect.exist()
  })
  it("then operations contains 'select.where.Id' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['select.where.Id']] |> expect.exist()
  })
  it("then operations contains 'update' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['update']] |> expect.exist()
  })
  it("then operations contains 'delete' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['delete']] |> expect.exist()
  })
})

describe("When todo |> operations[['insert']]()",{
  it("then todo is inserted into odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["get.config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    new.todo <- 'Task' |> Todo.Model()
    id <- new.todo[['id']]

    expected.todo <- new.todo  

    # When
    new.todo |> operations[['insert']]()

    # Then
    actual.todo <- id |> storage[['retrieve.where.id']]('Todo', fields)
    actual.todo |> expect.equal(expected.todo)

    id |> storage[['remove']]('Todo')
  })
  it("then todo is inserted into memory.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todos |> storage[['seed.table']]('Todo')

    new.todo <- 'Task' |> Todo.Model()
    id <- new.todo[['id']]

    expected.todo <- new.todo |> as.data.frame()

    # When
    new.todo |> operations[['insert']]()

    # Then
    actual.todo <- id |> storage[['retrieve.where.id']]('Todo', fields)
    actual.todo |> expect.equal.data(expected.todo)

    id |> storage[['remove']]('Todo')
  })
})

describe("When operations[['select']]()",{
  it("then all todos in odbc.storage is returned",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["get.config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    expected.todos <- 'Todo' |> storage[['retrieve']](fields)

    # When
    actual.todos <- operations[['select']]()

    # Then
    actual.todos |> expect.equal(expected.todos)
  })
  it("then all todos in memory.storage is returned",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todos |> storage[['seed.table']]('Todo')

    expected.todos <- 'Todo' |> storage[['retrieve']](fields)

    # When
    actual.todos <- operations[['select']]()

    # Then
    actual.todos |> expect.equal(expected.todos)
  })
})

describe("When id |> operations[['select.where.Id']]()",{
  it("then todo with id equal id is returned from odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["get.config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    existing.todos <- 'Todo' |> storage[['retrieve']](fields)
    existing.todo  <- existing.todos |> tail(1)
    existing.id    <- existing.todo[['id']]

    expected.todo <- existing.id |> storage[['retrieve.where.id']]('Todo', fields)

    # When
    actual.todo <- existing.id |> operations[['select.where.Id']]()

    # Then
    actual.todo |> expect.equal(expected.todo)
  })
  it("then todo with id equal id is returned from memory.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todos |> storage[['seed.table']]('Todo')

    existing.todos <- 'Todo' |> storage[['retrieve']](fields)
    existing.todo  <- existing.todos |> tail(1)
    existing.id    <- existing.todo[['id']]

    expected.todo <- existing.id |> storage[['retrieve.where.id']]('Todo', fields)

    # When
    actual.todo <- existing.id |> operations[['select.where.Id']]()

    # Then
    actual.todo |> expect.equal(expected.todo)
  })
})

describe("When todo |> operations[['update']]()",{
  it("then todo in odbc.storage is updated",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["get.config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    new.todo <- 'Task' |> Todo.Model()

    new.todo |> storage[['add']]('Todo')

    updated.todo <- new.todo |> as.data.frame()
    updated.todo[['status']] <- 'Done'

    id <- updated.todo[['id']]

    expected.todo <- updated.todo

    # When
    updated.todo |> operations[['update']]()

    # Then
    actual.todo <- id |> storage[['retrieve.where.id']]('Todo', fields)
    actual.todo |> expect.equal(expected.todo)

    id |> storage[['remove']]('Todo')
  })
  it("then todo in memory.storage is updated",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todos |> storage[['seed.table']]('Todo')

    new.todo <- 'Task' |> Todo.Model()

    new.todo |> storage[['add']]('Todo')

    updated.todo <- new.todo |> as.data.frame()
    updated.todo[['status']] <- 'Done'

    id <- updated.todo[['id']]

    expected.todo <- updated.todo

    # When
    updated.todo |> operations[['update']]()

    # Then
    actual.todo <- id |> storage[['retrieve.where.id']]('Todo', fields)
    actual.todo |> expect.equal.data(expected.todo)

    id |> storage[['remove']]('Todo')
  })
})

describe("When id |> operations[['delete']]()",{
  it("then todo with id are removed from odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["get.config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    new.todo <- 'Task' |> Todo.Model()

    new.todo |> storage[['add']]('Todo')

    id <- new.todo[['id']]

    expected.count <- 0

    # When
    id |> operations[['delete']]()

    # Then
    actual.count <- id |> storage[['retrieve.where.id']]('Todo', fields) |> nrow()
    actual.count |> expect.equal(expected.count)
  })
  it("then todo with is are removed from memory.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todos |> storage[['seed.table']]('Todo')

    new.todo <- 'Task' |> Todo.Model()
    new.todo |> storage[['add']]('Todo')

    id <- new.todo[['id']]

    expected.count <- 0

    # When
    id |> operations[['delete']]()

    # Then
    actual.count <- id |> storage[['retrieve.where.id']]('Todo', fields) |> nrow()
    actual.count |> expect.equal(expected.count)
  })
})
