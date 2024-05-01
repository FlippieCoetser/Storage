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
  it("then operations contains 'create.table' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['create.table']] |> expect.exist()
  })
  it("then operations contains 'seed.table' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['seed.table']] |> expect.exist()
  })
  it("then operations contains 'get.tables' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['get.tables']] |> expect.exist()
  })
  it("then operations contains 'execute.query' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['execute.query']] |> expect.exist()
  })
  it("then operations contains 'insert' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['insert']] |> expect.exist()
  })
  it("then operations contains 'select' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['select']] |> expect.exist()
  })
  it("then operations contains 'select.where.Id' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['select.where.Id']] |> expect.exist()
  })
  it("then operations contains 'update' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['update']] |> expect.exist()
  })
  it("then operations contains 'delete' operation",{
    # When
    operations <- Memory.Storage.Broker()

    # Then
    operations[['delete']] |> expect.exist()
  })
})

describe("When model |> operation[['create.table']](table)",{
  it("then table is created in memory",{
    # Given
    operation <- Memory.Storage.Broker()

    model <- Todo.Fields()
    table <- 'Todo'

    expected.tables <- data.frame(name = table)

    # When
    model |> operation[['create.table']](table)

    # Then
    operation[['get.tables']]() |> expect.equal(expected.tables)
  })
})

describe("when entities |> operation[['seed.table']](table)",{
  it("then entities are inserted into table in memory",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    seed.entities     <- Todos
    expected.entities <- seed.entities

    # When
    seed.entities |> operation[['seed.table']](table)

    # Then
    actual.entities <- table |> operation[['select']]()
    actual.entities |> expect.equal.data(expected.entities)
  })
})

describe("when operation[['get.tables']]()",{
  it("then returns data.frame with table names if data in memory has one or more table",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todos |> operation[['seed.table']](table)

    expected.table.names <- data.frame(name = table)

    # When
    actual.table.names <- operation[['get.tables']]()

    # Then
    actual.table.names |> expect.equal(expected.table.names)
  })
})

describe("when query |> operation[['execute.query']]()",{
  it("then an empty data frame is returned",{
    # Given
    operation <- Memory.Storage.Broker()

    query   <- "SELECT 1"

    # When
    results <- query |> operation[['execute.query']]()

    # Then
    results |> expect.data.frame()
  })
})

describe("when entity |> operation[['insert']](table)",{
  it("then entity is inserted into memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todos |> operation[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()
    id         <- new.entity[['id']]

    expected.entity <- new.entity

    # When
    new.entity |> operation[['insert']](table)

    # Then
    actual.entity <- id |> operation[['select.where.Id']](table)
    actual.entity |> expect.equal.data(expected.entity)

    id |> operation[['delete']](table)
  })
})

describe("when table |> operation[['select']]()",{
  it("then all entities are returned from memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todos |> operation[['seed.table']](table)

    expected.entities <- Todos

    # When
    actual.entities <- table |> operation[['select']]()

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
})

describe("when id |> operation[['select.where.Id']](table)",{
  it("then entity is returned from memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todos |> operation[['seed.table']](table)

    existing.entity <- Todos |> tail(1)

    expected.entity <- existing.entity
    id              <- existing.entity[['id']]

    # When
    actual.entity <- id |> operation[['select.where.Id']](table)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
})

describe("when entity |> operation[['update']](table)",{
  it("then entity is updated in table in memory data",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todos |> operation[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()
    new.entity |> operation[['insert']](table)

    id <- new.entity[['id']]

    updated.entity <- new.entity
    updated.entity[['status']] <- 'Updated'

    expected.entity <- updated.entity

    # When
    updated.entity |> operation[['update']](table)

    # Then
    actual.entity <- id |> operation[['select.where.Id']](table)
    actual.entity |> expect.equal.data(expected.entity)

    id |> operation[['delete']](table)
  })
})

describe("when id |> operation[['delete']](table)",{
  it("then entity with matching id is deleted from table in memory data if exist",{
    # Given
    operation <- Memory.Storage.Broker()

    table <- 'Todo'

    Todos |> operation[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()
    new.entity |> operation[['insert']](table)
    id <- new.entity[['id']]

    expected.entities <- Todos

    # When
    id |> operation[['delete']](table)

    # Then
    actual.entities <- table |> operation[['select']]()
    actual.entities |> expect.equal.data(expected.entities)
  })
})