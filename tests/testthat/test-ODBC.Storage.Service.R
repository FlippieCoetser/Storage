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
  it("then services contains ExecuteQuery service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["ExecuteQuery"]] |> expect.exist()
  })
  it("then services contains Add service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Add"]] |> expect.exist()
  })
  it("then services contains Retrieve service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Retrieve"]] |> expect.exist()
  })
  it("then services contains RetrieveWhereId service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["RetrieveWhereId"]] |> expect.exist()
  })
  it("then services contains Modify service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Modify"]] |> expect.exist()
  })
  it("then services contains Remove service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Remove"]] |> expect.exist()
  })
})

describe('When query |> service[["ExecuteQuery"]]()',{
  it('then broker[["ExecuteQuery"]]() is called with query',{
    # Given
    input.query  <- 'SELECT 1'
    actual.query <- NULL

    broker   <- list()
    broker[["ExecuteQuery"]] <- \(query) {
      actual.query <<- query
    }

    services <- broker |> ODBC.Storage.Service()

    expected.query <- input.query

    # When
    input.query |> services[["ExecuteQuery"]]()

    # Then
    actual.query |> expect.equal(expected.query)
  })
  it('then an exception is thrown is query is NULL',{
    # Given
    broker   <- list()
    broker[["ExecuteQuery"]] <- \(query) {} 

    services <- broker |> ODBC.Storage.Service()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> services[["ExecuteQuery"]]() |> expect.error(expected.error)
  })
})

describe("When entity |> service[['Add']](table)",{
  it("then entity |> broker[['Insert']](table) is called",{
    # Given
    input.entity <- data.frame(Id = 1)
    input.table  <- 'table'

    actual.entity <- NULL
    actual.table  <- NULL

    broker <- list()
    broker[['Insert']] <- \(entity, table) {
      actual.entity <<- entity
      actual.table  <<- table
    }

    services <- broker |> ODBC.Storage.Service()

    expected.entity <- input.entity
    expected.table  <- input.table

    # When
    input.entity |> services[['Add']](input.table)

    # Then
    actual.entity |> expect.equal(expected.entity)
    actual.table  |> expect.equal(expected.table)
  })
  it("then an exception is thrown if entity is NULL",{
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
})

describe("When table |> service[['Retrieve']](fields)",{
  it("then table |> broker[['Select']](fields) is called",{
    # Given
    input.fields <- list()
    input.table  <- 'table'

    actual.fields <- NULL
    actual.table  <- NULL

    broker <- list()
    broker[['Select']] <- \(table, fields) {
      actual.fields <<- fields
      actual.table  <<- table
    }

    services <- broker |> ODBC.Storage.Service()

    expected.fields <- input.fields
    expected.table  <- input.table

    # When
    input.table |> services[['Retrieve']](input.fields)

    # Then
    actual.fields |> expect.equal(expected.fields)
    actual.table  |> expect.equal(expected.table)
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
})

describe("When id |> service[['RetrieveWhereId']](table, fields)",{
  it("then id |> broker[['SelectWhereId']](table, fields) is called",{
    # Given
    input.fields <- list()
    input.table  <- 'table'
    input.id     <- uuid::UUIDgenerate()

    actual.fields <- NULL
    actual.table  <- NULL
    actual.id     <- NULL

    broker <- list()
    broker[['SelectWhereId']] <- \(id, table, fields) {
      actual.fields <<- fields
      actual.table  <<- table
      actual.id     <<- id
    }

    services <- broker |> ODBC.Storage.Service()

    expected.fields <- input.fields
    expected.table  <- input.table
    expected.id     <- input.id

    # When
    input.id |> services[['RetrieveWhereId']](input.table, input.fields)

    # Then
    actual.fields |> expect.equal(expected.fields)
    actual.table  |> expect.equal(expected.table)
    actual.id     |> expect.equal(expected.id)
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
})

describe("When entity |> service[['Modify']](table)",{
  it("then entity |> broker[['Update']](table) is called",{
    # Given
    input.entity <- data.frame(Id = '123')
    input.table  <- 'table'

    actual.entity <- NULL
    actual.table  <- NULL

    broker <- list()
    broker[['Update']] <- \(entity, table) {
      actual.entity <<- entity
      actual.table  <<- table
    }

    services <- broker |> ODBC.Storage.Service()

    expected.entity <- input.entity
    expected.table  <- input.table

    # When
    input.entity |> services[['Modify']](input.table)

    # Then
    actual.entity |> expect.equal(expected.entity)
    actual.table  |> expect.equal(expected.table)
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
})

describe("When id |> service[['Remove']](table)",{
  it("then id |> broker[['Delete']](table) is called",{
    # Given
    input.table <- 'table'
    input.id    <- uuid::UUIDgenerate()

    actual.table <- NULL
    actual.id    <- NULL

    broker <- list()
    broker[['Delete']] <- \(id, table) {
      actual.table <<- table
      actual.id    <<- id
    }

    services <- broker |> ODBC.Storage.Service()

    expected.table <- input.table
    expected.id    <- input.id

    # When
    input.id |> services[['Remove']](input.table)

    # Then
    actual.table |> expect.equal(expected.table)
    actual.id    |> expect.equal(expected.id)
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
})