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
  it("then operations contains 'Insert' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Insert']] |> expect.exist()
  })
  it("then operations contains 'Select' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Select']] |> expect.exist()
  })
  it("then operations contains 'SelectWhereId' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['SelectWhereId']] |> expect.exist()
  })
  it("then operations contains 'Update' operation",{
    # When
    operations <- Todo.Broker()

    # Then
    operations[['Update']] |> expect.exist()
  })
  it("then operations contains 'Delete' operation",{
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
    storage    <- configurator[["Get.Config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    new.todo <- 'Task' |> Todo()
    id <- new.todo[['id']]

    expected.todo <- new.todo  

    # When
    new.todo |> operations[['Insert']]()

    # Then
    actual.todo <- id |> storage[['RetrieveWhereId']]('Todo', fields)
    actual.todo |> expect.equal(expected.todo)

    id |> storage[['Remove']]('Todo')
  })
  it("then todo is inserted into memory.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    new.todo <- 'Task' |> Todo()
    id <- new.todo[['id']]

    expected.todo <- new.todo |> as.data.frame()

    # When
    new.todo |> operations[['Insert']]()

    # Then
    actual.todo <- id |> storage[['RetrieveWhereId']]('Todo', fields)
    actual.todo |> expect.equal.data(expected.todo)

    id |> storage[['Remove']]('Todo')
  })
})

describe("When operations[['Select']]()",{
  it("then all todos in odbc.storage is returned",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["Get.Config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    expected.todos <- 'Todo' |> storage[['Retrieve']](fields)

    # When
    actual.todos <- operations[['Select']]()

    # Then
    actual.todos |> expect.equal(expected.todos)
  })
  it("then all todos in memory.storage is returned",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    expected.todos <- 'Todo' |> storage[['Retrieve']](fields)

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
    storage    <- configurator[["Get.Config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    existing.todos <- 'Todo' |> storage[['Retrieve']](fields)
    existing.todo  <- existing.todos |> tail(1)
    existing.id    <- existing.todo[['id']]

    expected.todo <- existing.id |> storage[['RetrieveWhereId']]('Todo', fields)

    # When
    actual.todo <- existing.id |> operations[['SelectWhereId']]()

    # Then
    actual.todo |> expect.equal(expected.todo)
  })
  it("then todo with id equal id is returned from memory.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    existing.todos <- 'Todo' |> storage[['Retrieve']](fields)
    existing.todo  <- existing.todos |> tail(1)
    existing.id    <- existing.todo[['id']]

    expected.todo <- existing.id |> storage[['RetrieveWhereId']]('Todo', fields)

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
    storage    <- configurator[["Get.Config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    new.todo <- 'Task' |> Todo()

    new.todo |> storage[['Add']]('Todo')

    updated.todo <- new.todo |> as.data.frame()
    updated.todo[['status']] <- 'Done'

    id <- updated.todo[['id']]

    expected.todo <- updated.todo

    # When
    updated.todo |> operations[['Update']]()

    # Then
    actual.todo <- id |> storage[['RetrieveWhereId']]('Todo', fields)
    actual.todo |> expect.equal(expected.todo)

    id |> storage[['Remove']]('Todo')
  })
  it("then todo in memory.storage is updated",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    new.todo <- 'Task' |> Todo()

    new.todo |> storage[['Add']]('Todo')

    updated.todo <- new.todo |> as.data.frame()
    updated.todo[['status']] <- 'Done'

    id <- updated.todo[['id']]

    expected.todo <- updated.todo

    # When
    updated.todo |> operations[['Update']]()

    # Then
    actual.todo <- id |> storage[['RetrieveWhereId']]('Todo', fields)
    actual.todo |> expect.equal.data(expected.todo)

    id |> storage[['Remove']]('Todo')
  })
})

describe("When id |> operations[['Delete']]()",{
  it("then todo with id are removed from odbc.storage",{
    skip_if_not(environment == 'local')
    # Given
    storage    <- configurator[["Get.Config"]]() |> Storage.Orchestrator('odbc')
    operations <- storage |> Todo.Broker()

    new.todo <- 'Task' |> Todo()

    new.todo |> storage[['Add']]('Todo')

    id <- new.todo[['id']]

    expected.count <- 0

    # When
    id |> operations[['Delete']]()

    # Then
    actual.count <- id |> storage[['RetrieveWhereId']]('Todo', fields) |> nrow()
    actual.count |> expect.equal(expected.count)
  })
  it("then todo with is are removed from memory.storage",{
    # Given
    storage    <- configuration |> Storage.Orchestrator('memory')
    operations <- storage |> Todo.Broker()

    Todo.Mock.Data |> storage[['Seed.Table']]('Todo')

    new.todo <- 'Task' |> Todo()
    new.todo |> storage[['Add']]('Todo')

    id <- new.todo[['id']]

    expected.count <- 0

    # When
    id |> operations[['Delete']]()

    # Then
    actual.count <- id |> storage[['RetrieveWhereId']]('Todo', fields) |> nrow()
    actual.count |> expect.equal(expected.count)
  })
})
