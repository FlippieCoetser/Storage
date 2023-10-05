describe('ODBC.Storage.Service',{
  it('Exist',{
    ODBC.Storage.Service |> expect.exist()
  })
})

describe("When services <- ODBC.Storage.Service()",{
  it('then services a list',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services |> expect.list()
  })
  it('then services contains Execute.Query service',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Execute.Query"]] |> expect.exist()
  })
  it('then services contains Add service',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Add"]] |> expect.exist()
  })
  it('then services contains Retrieve service',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Retrieve"]] |> expect.exist()
  })
  it('then services contains RetrieveWhereId service',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["RetrieveWhereId"]] |> expect.exist()
  })
  it('then services contains Modify service',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Modify"]] |> expect.exist()
  })
  it('then services contains Remove service',{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Remove"]] |> expect.exist()
  })
})

describe('When query |> service[["Execute.Query"]]()',{
  it('then broker[["Execute.Query"]]() is called with query',{
    # Given
    input.query  <- 'SELECT 1'
    actual.query <- NULL

    broker   <- list()
    broker[["Execute.Query"]] <- \(query) {
      actual.query <<- query
    }

    services <- broker |> ODBC.Storage.Service()

    expected.query <- input.query

    # When
    input.query |> services[["Execute.Query"]]()

    # Then
    actual.query |> expect.equal(expected.query)
  })
  it('then an exception is thrown is query is NULL',{
    # Given
    broker   <- list()
    broker[["Execute.Query"]] <- \(query) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> services[["Execute.Query"]]() |> expect.error(expected.error)
  })
})

describe("When entity |> service[['Add']](table)",{
  it("then entity is added to storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    expected.entity <- entity
    expected.table  <- table

    # When
    entity |> services[['Add']](table)

    # Then
    actual.entity <- entity[['Id']] |> broker[['SelectWhereId']](table, fields)
    actual.entity |> expect.equal(expected.entity)

    entity[['Id']] |> broker[['Delete']](table)
  })
  it('then an exception is thrown if entity is NULL',{
    # Given
    broker <- list()
    broker[['Insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # When
    entity <- NULL

    # Then
    entity |> services[['Add']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity is not a data.frame',{
    # Given
    broker <- list()
    broker[['Insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # When
    entity <- list()

    # Then
    entity |> services[['Add']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity does not have one row',{
    # Given
    broker <- list()
    broker[['Insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # When
    entity <- data.frame()

    # Then
    entity |> services[['Add']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    broker <- list()
    broker[['Insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    entity <- data.frame(Id = 1)

    # When
    table <- NULL

    # Then
    entity |> services[['Add']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    broker <- list()
    broker[['Insert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    entity <- data.frame(Id = 1)

    # When
    table <- list()

    # Then
    entity |> services[['Add']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity is not new',{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: Key.Violation: Duplicate Primary Key not allowed."

    entities <- broker[['Select']](table, fields) 

    # When
    entity <- entities |> tail(1)

    # Then
    entity |> services[['Add']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is invalid',{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: Table.Invalid: Invalid is not a valid table."

    entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    # When
    table <- 'Invalid'

    # Then
    entity |> services[['Add']](table) |> expect.error(expected.error)
  })
})

describe("When table |> service[['Retrieve']](fields)",{
  it("then a data.frame is returned from storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    # When
    retrieved.entities <- table |> services[['Retrieve']](fields)

    # Then
    actual.entities <- table |> broker[['Select']](fields)
    actual.entities |> expect.equal(retrieved.entities)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    broker <- list()
    broker[['Select']] <- \(table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # When
    table <- NULL

    # Then
    table |> services[['Retrieve']](list()) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    broker <- list()
    broker[['Select']] <- \(table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    # When
    table <- list()

    # Then
    table |> services[['Retrieve']](list()) |> expect.error(expected.error)

  })
  it('then an exception is thrown if table is invalid',{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    invalid.table <- 'Invalid'
    expected.error <- "ODBC.Storage: Table.Invalid: Invalid is not a valid table."

    # Then
    invalid.table |> services[['Retrieve']]() |> expect.error(expected.error)
  })
})

describe("When id |> service[['RetrieveWhereId']](table, fields)",{
  it("then entity wit id is returned from storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()
    
    existing.entities <- table |> broker[['Select']](fields)
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['Id']]

    expected.entity <- existing.entity

    # When
    retrieved.entity <- id |> services[['RetrieveWhereId']](table, fields)

    # Then
    retrieved.entity |> expect.equal.data(expected.entity)
  })
  it('then an exception is thrown if id is NULL',{
    # Given
    broker <- list()
    broker[['SelectWhereId']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # When
    id <- NULL

    # Then
    id |> services[['RetrieveWhereId']]('table', list()) |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is not character',{
    # Given
    broker <- list()
    broker[['SelectWhereId']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    # When
    id <- list()

    # Then
    id |> services[['RetrieveWhereId']]('table', list()) |> expect.error(expected.error)
  })
  it('then an exception is thrown if id in invalid identifier',{
    # Given
    broker <- list()
    broker[['SelectWhereId']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # When
    id <- 'a'

    # Then
    id |> services[['RetrieveWhereId']]('table', list()) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    broker <- list()
    broker[['SelectWhereId']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    id <- uuid::UUIDgenerate()

    # When
    table <- NULL

    # Then
    id |> services[['RetrieveWhereId']](table, list()) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    broker <- list()
    broker[['SelectWhereId']] <- \(id, table, fields) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    id <- uuid::UUIDgenerate()

    # When
    table <- list()

    # Then
    id |> services[['RetrieveWhereId']](table, list()) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is invalid',{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    invalid.table <- 'Invalid'
    expected.error <- "ODBC.Storage: Table.Invalid: Invalid is not a valid table."

    id <- uuid::UUIDgenerate()

    # Then
    id |> services[['RetrieveWhereId']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When entity |> service[['Modify']](table)",{
  it("then entity with matching Id is updated in storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    new.entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    new.entity |> broker[['Insert']](table)

    updated.entity <- new.entity
    updated.entity[['Status']] <- 'Updated'

    expected.entity <- updated.entity

    # When
    updated.entity |> services[['Modify']](table)

    # Then
    retrieved.entity <- updated.entity[['Id']] |> broker[['SelectWhereId']](table, fields)
    retrieved.entity |> expect.equal(expected.entity)

    updated.entity[['Id']] |> broker[['Delete']](table)
  })
  it('then an exception is thrown if entity is NULL',{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # When
    entity <- NULL

    # Then
    entity |> services[['Modify']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity is not a data.frame',{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # When
    entity <- list()

    # Then
    entity |> services[['Modify']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity does not have one row',{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # When
    entity <- data.frame()

    # Then
    entity |> services[['Modify']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    entity <- data.frame(Id = 1)

    # When
    table <- NULL

    # Then
    entity |> services[['Modify']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    broker <- list()
    broker[['Upsert']] <- \(entity, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    entity <- data.frame(Id = 1)

    # When
    table <- list()

    # Then
    entity |> services[['Modify']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is invalid',{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: Table.Invalid: Invalid is not a valid table."

    entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    # When
    table <- 'Invalid'

    # Then
    entity |> services[['Modify']](table) |> expect.error(expected.error)
  })
})

describe("When id |> service[['Remove']](table)",{
  it("then entity with matching id is delete from storage",{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    new.entity <- data.frame(
      Id = uuid::UUIDgenerate(),
      Task = 'Task',
      Status = 'New'
    )

    new.entity |> broker[['Insert']](table)

    existing.entity <- new.entity

    deleted.entity <- existing.entity

    # When
    existing.entity[['Id']] |> services[['Remove']](table)

    # Then
    retrieved.entity <- deleted.entity[['Id']] |> broker[['SelectWhereId']](table, fields)
    retrieved.entity |> expect.rows(0)
  })
  it('then an exception is thrown if id is NULL',{
    # Given
    broker <- list()
    broker[['Delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # When
    id <- NULL

    # Then
    id |> services[['Remove']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is not character',{
    # Given
    broker <- list()
    broker[['Delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    # When
    id <- list()

    # Then
    id |> services[['Remove']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is invalid identifier',{
    # Given
    broker <- list()
    broker[['Delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # When
    id <- 'a'

    # Then
    id |> services[['Remove']]('table') |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    broker <- list()
    broker[['Delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    id <- uuid::UUIDgenerate()

    # When
    table <- NULL

    # Then
    id |> services[['Remove']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    broker <- list()
    broker[['Delete']] <- \(id, table) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'character'."

    id <- uuid::UUIDgenerate()

    # When
    table <- list()

    # Then
    id |> services[['Remove']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is invalid',{
    skip_if_not(environment == 'local')
    # Given
    broker <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    services <- broker |> ODBC.Storage.Service()

    expected.error <- "ODBC.Storage: Table.Invalid: Invalid is not a valid table."

    id <- uuid::UUIDgenerate()

    # When
    table <- 'Invalid'

    # Then
    id |> services[['Remove']](table) |> expect.error(expected.error)
  })
})