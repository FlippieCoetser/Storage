describe('ODBC.Storage.Broker',{
  it('Exist',{
    ODBC.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- configuration |> ODBC.Storage.Broker()",{
  it("then operations is a list",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains 'execute.query' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['execute.query']] |> expect.exist()
  })
  it("then operations contains 'get.tables' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['get.tables']] |> expect.exist()
  })
  it("then operations contains 'insert' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['insert']] |> expect.exist()
  })
  it("then operations contains 'select' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['select']] |> expect.exist()
  })
  it("then operations contains 'select.where.Id' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['select.where.Id']] |> expect.exist()
  })
  it("then operations contains 'update' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['update']] |> expect.exist()
  })
  it("then operations contains 'delete' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['delete']] |> expect.exist()
  })
})

describe("when query |> operate[['execute.query']]()",{
  it("then no exception is thrown is query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # Then
    query |> operate[['execute.query']]() |> expect.no.error()
  })
  it("then a data.frame is returned if query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # When
    output <- query |> operate[['execute.query']]() 

    # Then
    output |> expect.data.frame()
  })
})

describe("when operate[['get.tables']]()",{
  it("then a data.frame containing tables names is returned",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    # When
    tables <- operate[['get.tables']]() 

    # Then
    tables |> expect.data.frame()
  })
})

describe("When table |> operate[['select']]()",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    # When
    entities <- table |> operate[['select']]() 
    
    # Then
    entities |> expect.data.frame()
  })
})

describe("When table |> operate[['select']](fields)",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    # When
    entities <- table |> operate[['select']](fields) 
    
    # Then
    entities |> expect.data.frame()
  })
})

describe("When id |> operate[['select.where.Id']](table)",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    existing.entities <- table |> operate[['select']]()
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['id']]

    # When
    actual.entity <- id |> operate[['select.where.Id']](table) 
    
    # Then
    actual.entity |> expect.data.frame()
  })
})

describe("When id |> operate[['select.where.Id']](table, fields)",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["get.config"]]() |> ODBC.Storage.Broker()

    existing.entities <- table |> operate[['select']]()
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['id']]

    # When
    actual.entity <- id |> operate[['select.where.Id']](table, fields) 
    
    # Then
    actual.entity |> expect.data.frame()
  })
})