describe('ODBC.Storage.Service',{
  it('Exist',{
    ODBC.Storage.Service |> expect.exist()
  })
})

describe("When services <- ODBC.Storage.Service()",{
  it("then services a list",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services |> expect.list()
  })
  it("then services contains 'execute.query' service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["execute.query"]] |> expect.exist()
  })
  it("then services contains 'add' service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["add"]] |> expect.exist()
  })
  it("then services contains 'retrieve' service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["retrieve"]] |> expect.exist()
  })
  it("then services contains 'retrieve.where.id' service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["retrieve.where.id"]] |> expect.exist()
  })
  it("then services contains 'modify' service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["modify"]] |> expect.exist()
  })
  it("then services contains 'remove' service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["remove"]] |> expect.exist()
  })
})

describe("When query |> service[['execute.query']]()",{
  it("then broker[['execute.query']]() is called with query",{
    # Given
    input.query  <- 'SELECT 1'
    actual.query <- NULL

    broker   <- list()
    broker[["execute.query"]] <- \(query) {
      actual.query <<- query
    }

    services <- broker |> ODBC.Storage.Service()

    expected.query <- input.query

    # When
    input.query |> services[["execute.query"]]()

    # Then
    actual.query |> expect.equal(expected.query)
  })
  it("then an exception is thrown is query is NULL",{
    # Given
    broker   <- list()
    broker[["execute.query"]] <- \(query) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> services[["execute.query"]]() |> expect.error(expected.error)
  })
})

describe("When entity |> service[['add']](table)",{
  it("then entity is added to storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[['get.config']]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    entity <- 'Task' |> Todo.Model()

    expected.entity <- entity
    expected.table  <- table

    # When
    entity |> services[['add']](table)

    # Then
    actual.entity <- entity[['id']] |> broker[['select.where.Id']](table, fields)
    actual.entity |> expect.equal(expected.entity)

    entity[['id']] |> broker[['delete']](table)
  })
  it("then an exception is thrown if entity is NULL",{
    # Given
    broker <- list()
    broker[['insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # When
    entity <- NULL

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not a data.frame",{
    # Given
    broker <- list()
    broker[['insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # When
    entity <- list()

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity does not have one row",{
    # Given
    broker <- list()
    broker[['insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # When
    entity <- data.frame()

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    broker <- list()
    broker[['insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    entity <- data.frame(Id = 1)

    # When
    table <- NULL

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    broker <- list()
    broker[['insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    entity <- data.frame(Id = 1)

    # When
    table <- list()

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not new",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: key.violation: Duplicate Primary Key not allowed."

    entities <- broker[['select']](table, fields) 

    # When
    entity <- entities |> tail(1)

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: table.invalid: Invalid is not a valid table."

    entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    # When
    table <- 'Invalid'

    # Then
    entity |> services[['add']](table) |> expect.error(expected.error)
  })
})

describe("When table |> service[['retrieve']](fields)",{
  it("then a data.frame is returned from storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    # When
    retrieved.entities <- table |> services[['retrieve']](fields)

    # Then
    actual.entities <- table |> broker[['select']](fields)
    actual.entities |> expect.equal(retrieved.entities)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    broker <- list()
    broker[['select']] <- \(table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # When
    table <- NULL

    # Then
    table |> services[['retrieve']](list()) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    broker <- list()
    broker[['select']] <- \(table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    # When
    table <- list()

    # Then
    table |> services[['retrieve']](list()) |> expect.error(expected.error)

  })
  it("then an exception is thrown if table is invalid",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    invalid.table <- 'Invalid'
    expected.error <- "ODBC.Storage: table.invalid: Invalid is not a valid table."

    # Then
    invalid.table |> services[['retrieve']]() |> expect.error(expected.error)
  })
})

describe("When id |> service[['retrieve.where.id']](table, fields)",{
  it("then entity wit id is returned from storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()
    
    existing.entities <- table |> broker[['select']](fields)
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['id']]

    expected.entity <- existing.entity

    # When
    retrieved.entity <- id |> services[['retrieve.where.id']](table, fields)

    # Then
    retrieved.entity |> expect.equal.data(expected.entity)
  })
  it("then an exception is thrown if id is NULL",{
    # Given
    broker <- list()
    broker[['select.where.Id']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # When
    id <- NULL

    # Then
    id |> services[['retrieve.where.id']](table, list()) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is not character",{
    # Given
    broker <- list()
    broker[['select.where.Id']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    # When
    id <- list()

    # Then
    id |> services[['retrieve.where.id']](table, list()) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id in invalid identifier",{
    # Given
    broker <- list()
    broker[['select.where.Id']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # When
    id <- 'a'

    # Then
    id |> services[['retrieve.where.id']](table, list()) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    broker <- list()
    broker[['select.where.Id']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    id <- uuid::UUIDgenerate()

    # When
    table <- NULL

    # Then
    id |> services[['retrieve.where.id']](table, list()) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    broker <- list()
    broker[['select.where.Id']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    id <- uuid::UUIDgenerate()

    # When
    table <- list()

    # Then
    id |> services[['retrieve.where.id']](table, list()) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    invalid.table <- 'Invalid'
    expected.error <- "ODBC.Storage: table.invalid: Invalid is not a valid table."

    id <- uuid::UUIDgenerate()

    # Then
    id |> services[['retrieve.where.id']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When entity |> service[['modify']](table)",{
  it("then entity with matching Id is updated in storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    new.entity <- 'Task' |> Todo.Model()
    new.entity |> broker[['insert']](table)

    updated.entity <- new.entity
    updated.entity[['status']] <- 'Updated'

    expected.entity <- updated.entity

    # When
    updated.entity |> services[['modify']](table)

    # Then
    retrieved.entity <- updated.entity[['id']] |> broker[['select.where.Id']](table, fields)
    retrieved.entity |> expect.equal(expected.entity)

    updated.entity[['id']] |> broker[['delete']](table)
  })
  it("then an exception is thrown if entity is NULL",{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # When
    entity <- NULL

    # Then
    entity |> services[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not a data.frame",{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # When
    entity <- list()

    # Then
    entity |> services[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity does not have one row",{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # When
    entity <- data.frame()

    # Then
    entity |> services[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    entity <- data.frame(Id = 1)

    # When
    table <- NULL

    # Then
    entity |> services[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    entity <- data.frame(Id = 1)

    # When
    table <- list()

    # Then
    entity |> services[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: table.invalid: Invalid is not a valid table."

    entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    # When
    table <- 'Invalid'

    # Then
    entity |> services[['modify']](table) |> expect.error(expected.error)
  })
})

describe("When id |> service[['remove']](table)",{
  it("then entity with matching id is delete from storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    new.entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    new.entity |> broker[['insert']](table)

    existing.entity <- new.entity

    deleted.entity <- existing.entity

    # When
    existing.entity[['Id']] |> services[['remove']](table)

    # Then
    retrieved.entity <- deleted.entity[['Id']] |> broker[['select.where.Id']](table, fields)
    retrieved.entity |> expect.rows(0)
  })
  it("then an exception is thrown if id is NULL",{
    # Given
    broker <- list()
    broker[['delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # When
    id <- NULL

    # Then
    id |> services[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is not character",{
    # Given
    broker <- list()
    broker[['delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    # When
    id <- list()

    # Then
    id |> services[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is invalid identifier",{
    # Given
    broker <- list()
    broker[['delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # When
    id <- 'a'

    # Then
    id |> services[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    broker <- list()
    broker[['delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    id <- uuid::UUIDgenerate()

    # When
    table <- NULL

    # Then
    id |> services[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    broker <- list()
    broker[['delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    id <- uuid::UUIDgenerate()

    # When
    table <- list()

    # Then
    id |> services[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: table.invalid: Invalid is not a valid table."

    id <- uuid::UUIDgenerate()

    # When
    table <- 'Invalid'

    # Then
    id |> services[['remove']](table) |> expect.error(expected.error)
  })
})