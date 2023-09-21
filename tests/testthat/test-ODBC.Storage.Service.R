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
  it("then services contains Insert service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Insert"]] |> expect.exist()
  })
  it("then services contains Select service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Select"]] |> expect.exist()
  })
  it("then services contains SelectWhereId service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["SelectWhereId"]] |> expect.exist()
  })
  it("then services contains Update service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Update"]] |> expect.exist()
  })
  it("then services contains Delete service",{
    # Given
    services <- ODBC.Storage.Service()

    # Then
    services[["Delete"]] |> expect.exist()
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

describe("When entity |> service[['Insert']](table)",{
  it("then entity |> broker[['Insert']](table) is called",{
    # Given
    input.entity <- list()
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
    input.entity |> services[['Insert']](input.table)

    # Then
    actual.entity |> expect.equal(expected.entity)
    actual.table  |> expect.equal(expected.table)
  })
})

describe("When fields |> service[['Select']](table)",{
  it("then fields |> broker[['Select']](table) is called",{
    # Given
    input.fields <- list()
    input.table  <- 'table'

    actual.fields <- NULL
    actual.table  <- NULL

    broker <- list()
    broker[['Select']] <- \(fields, table) {
      actual.fields <<- fields
      actual.table  <<- table
    }

    services <- broker |> ODBC.Storage.Service()

    expected.fields <- input.fields
    expected.table  <- input.table

    # When
    input.fields |> services[['Select']](input.table)

    # Then
    actual.fields |> expect.equal(expected.fields)
    actual.table  |> expect.equal(expected.table)
  })
})

describe("When fields |> service[['SelectWhereId']](table, id)",{
  it("then fields |> broker[['SelectWhereId']](table, id) is called",{
    # Given
    input.fields <- list()
    input.table  <- 'table'
    input.id     <- 1

    actual.fields <- NULL
    actual.table  <- NULL
    actual.id     <- NULL

    broker <- list()
    broker[['SelectWhereId']] <- \(fields, table, id) {
      actual.fields <<- fields
      actual.table  <<- table
      actual.id     <<- id
    }

    services <- broker |> ODBC.Storage.Service()

    expected.fields <- input.fields
    expected.table  <- input.table
    expected.id     <- input.id

    # When
    input.fields |> services[['SelectWhereId']](input.table, input.id)

    # Then
    actual.fields |> expect.equal(expected.fields)
    actual.table  |> expect.equal(expected.table)
    actual.id     |> expect.equal(expected.id)
  })
})

describe("When entity |> service[['Update']](table)",{
  it("then entity |> broker[['Update']](table) is called",{
    # Given
    input.entity <- list()
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
    input.entity |> services[['Update']](input.table)

    # Then
    actual.entity |> expect.equal(expected.entity)
    actual.table  |> expect.equal(expected.table)
  })
})

describe("When id |> service[['Delete']](table)",{
  it("then id |> broker[['Delete']](table) is called",{
    # Given
    input.table <- 'table'
    input.id    <- 1

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
    input.id |> services[['Delete']](input.table)

    # Then
    actual.table |> expect.equal(expected.table)
    actual.id    |> expect.equal(expected.id)
  })
})