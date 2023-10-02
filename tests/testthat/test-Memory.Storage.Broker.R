describe("Memory.Storage.Broker",{
  it("Exist",{
    Memory.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- configuration |> Memory.Storage.Broker()",{
  it("then operations is a list",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it('then operations contains Create.Table operation',{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Create.Table']] |> expect.exist()
  })
  it("then operations contains Seed.Table operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Seed.Table']] |> expect.exist()
  })
  it("then operations contains Get.Tables operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Get.Tables']] |> expect.exist()
  })
  it("then operations contains Execute.Query operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Execute.Query']] |> expect.exist()
  })
  it("then operations contains Insert operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Insert']] |> expect.exist()
  })
  it("then operations contains Select operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Select']] |> expect.exist()
  })
  it("then operations contains SelectWhereId operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['SelectWhereId']] |> expect.exist()
  })
  it("then operations contains Update operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Update']] |> expect.exist()
  })
  it("then operations contains Delete operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Delete']] |> expect.exist()
  })
})

describe("When model |> operation[['Create.Table']](table)",{
  it("then table is created in memory",{
    # Given
    operation <- Memory.Storage.Broker()

    model <- data.frame(
      Id     = character(0),
      Task   = character(0),
      Status = character(0)
    )

    table <- 'Todo'

    # When
    model |> operation[['Create.Table']](table)

    # Then
    operation[['Get.Tables']]() |> expect.equal(table)
  })
})

describe("when entities |> operation[['Seed.Table']](table)",{
  it("then entities are inserted into table in memory",{
    # Given
    operation <- configuration |> Memory.Storage.Broker()

    table <- 'Todo'

    seed.entities     <- Todo.Mock.Data
    expected.entities <- seed.entities

    # When
    seed.entities |> operation[['Seed.Table']](table)

    # Then
    actual.entities <- table |> operation[['Select']]()
    actual.entities |> expect.equal.data(expected.entities)
  })
})

describe("when operation[['Get.Tables']]()",{
  it("then returns data.frame with table names if data in memory has one or more table",{
    # Given
    operation <- Memory.Storage.Broker()
    Todo.Mock.Data |> operation[['Seed.Table']]('Todo')

    expected.table.names <- 'Todo'

    # When
    actual.table.names <- operation[['Get.Tables']]()

    # Then
    actual.table.names |> expect.equal(expected.table.names)
  })
})

describe("when query |> operation[['Execute.Query']]()",{
  it("then an empty data frame is returned",{
    # Given
    operation <- Memory.Storage.Broker()

    # When
    query <- "SELECT 1"
    results <- query |> operation[['Execute.Query']]()

    # Then
    results |> expect.data.frame()
  })
})

describe("when entity |> operation[['Insert']](table)",{
  it("then entity is inserted into memory data",{
    # Given
    configuration <- data.frame()

    operation <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> operation[['Seed.Table']]('Todo')

    new.todo <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    id <- new.todo[['Id']]

    expected.todo <- new.todo

    # When
    new.todo |> operation[['Insert']]('Todo')

    # Then
    actual.todo <- id |> operation[['SelectWhereId']]('Todo')
    actual.todo |> expect.equal.data(expected.todo)

    id |> operation[['Delete']]('Todo')
  })
})

describe("when table |> operation[['Select']]()",{
  it("then all entities are returned from memory data",{
    # Given
    configuration <- data.frame()

    operation <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> operation[['Seed.Table']]('Todo')

    expected.todos <- Todo.Mock.Data

    # When
    actual.todos <- 'Todo' |> operation[['Select']]()

    # Then
    actual.todos |> expect.equal.data(expected.todos)
  })
})

describe("when id |> operation[['SelectWhereId']](table)",{
  it("then entity is returned from memory data",{
    # Given
    configuration <- data.frame()

    operation <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> operation[['Seed.Table']]('Todo')

    existing.todo <- Todo.Mock.Data |> tail(1)

    expected.todo <- existing.todo
    id            <- existing.todo[['Id']]

    # When
    actual.todo <- id |> operation[['SelectWhereId']]('Todo')

    # Then
    actual.todo |> expect.equal.data(expected.todo)
  })
})

describe("when entity |> operation[['Update']](table)",{
  it("then entity is updated in table in memory data",{
    # Given
    configuration <- data.frame()

    operation <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> operation[['Seed.Table']]('Todo')

    new.todo <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    new.todo |> operation[['Insert']]('Todo')
    id <- new.todo[['Id']]

    updated.todo <- new.todo
    updated.todo[['Status']] <- 'Updated'

    expected.todo <- updated.todo

    # When
    updated.todo |> operation[['Update']]('Todo')

    # Then
    actual.todo <- id |> operation[['SelectWhereId']]('Todo')
    actual.todo |> expect.equal.data(expected.todo)

    id |> operation[['Delete']]('Todo')
  })
})

describe("when id |> operation[['Delete']](table)",{
  it("then entity with matching id is deleted from table in memory data if exist",{
    # Given
    configuration <- data.frame()

    operation <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> operation[['Seed.Table']]('Todo')

    new.todo <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    new.todo |> operation[['Insert']]('Todo')
    id <- new.todo[['Id']]

    expected.todos <- Todo.Mock.Data

    # When
    id |> operation[['Delete']]('Todo')

    # Then
    actual.todos <- 'Todo' |> operation[['Select']]()
    actual.todos |> expect.equal.data(expected.todos)
  })
})