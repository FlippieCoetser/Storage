describe('Memory.Storage.Broker',{
  it('Exist',{
    Memory.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- Memory.Storage.Broker()",{
  it("then operations is a list",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains 'Create.Table' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Create.Table']] |> expect.exist()
  })
  it("then operations contains 'Seed.Table' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Seed.Table']] |> expect.exist()
  })
  it("then operations contains 'Get.Tables' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Get.Tables']] |> expect.exist()
  })
  it("then operations contains 'Execute.Query' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Execute.Query']] |> expect.exist()
  })
  it("then operations contains 'Insert' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Insert']] |> expect.exist()
  })
  it("then operations contains 'Select' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Select']] |> expect.exist()
  })
  it("then operations contains 'SelectWhereId' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['SelectWhereId']] |> expect.exist()
  })
  it("then operations contains 'Update' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['Update']] |> expect.exist()
  })
  it("then operations contains 'Delete' operation",{
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

    model <- Todo.Model()
    table <- 'Todo'

    expected.tables <- data.frame(name = table)

    # When
    model |> operation[['Create.Table']](table)

    # Then
    operation[['Get.Tables']]() |> expect.equal(expected.tables)
  })
})

describe("when entities |> operation[['Seed.Table']](table)",{
  it("then entities are inserted into table in memory",{
    # Given
    operation <- Memory.Storage.Broker()

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

    table <- 'Todo'

    Todo.Mock.Data |> operation[['Seed.Table']](table)

    expected.table.names <- data.frame(name = table)

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

    query   <- "SELECT 1"

    # When
    results <- query |> operation[['Execute.Query']]()

    # Then
    results |> expect.data.frame()
  })
})

describe("when entity |> operation[['Insert']](table)",{
  it("then entity is inserted into memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todo.Mock.Data |> operation[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()
    id         <- new.entity[['Id']]

    expected.entity <- new.entity

    # When
    new.entity |> operation[['Insert']](table)

    # Then
    actual.entity <- id |> operation[['SelectWhereId']](table)
    actual.entity |> expect.equal.data(expected.entity)

    id |> operation[['Delete']](table)
  })
})

describe("when table |> operation[['Select']]()",{
  it("then all entities are returned from memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todo.Mock.Data |> operation[['Seed.Table']](table)

    expected.entities <- Todo.Mock.Data

    # When
    actual.entities <- table |> operation[['Select']]()

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
})

describe("when id |> operation[['SelectWhereId']](table)",{
  it("then entity is returned from memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todo.Mock.Data |> operation[['Seed.Table']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)

    expected.entity <- existing.entity
    id              <- existing.entity[['Id']]

    # When
    actual.entity <- id |> operation[['SelectWhereId']](table)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
})

describe("when entity |> operation[['Update']](table)",{
  it("then entity is updated in table in memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todo.Mock.Data |> operation[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()
    new.entity |> operation[['Insert']](table)

    id <- new.entity[['Id']]

    updated.entity <- new.entity
    updated.entity[['Status']] <- 'Updated'

    expected.entity <- updated.entity

    # When
    updated.entity |> operation[['Update']](table)

    # Then
    actual.entity <- id |> operation[['SelectWhereId']](table)
    actual.entity |> expect.equal.data(expected.entity)

    id |> operation[['Delete']](table)
  })
})

describe("when id |> operation[['Delete']](table)",{
  it("then entity with matching id is deleted from table in memory data if exist",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todo.Mock.Data |> operation[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()
    new.entity |> operation[['Insert']](table)
    id <- new.entity[['Id']]

    expected.entities <- Todo.Mock.Data

    # When
    id |> operation[['Delete']](table)

    # Then
    actual.entities <- table |> operation[['Select']]()
    actual.entities |> expect.equal.data(expected.entities)
  })
})