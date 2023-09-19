describe("ODBC.Storage.Broker",{
  it("Exist",{
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
  it("then operations contains CreateConnection operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['CreateConnection']] |> expect.exist()
  })
  it("then operations contains ExecuteQuery operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['ExecuteQuery']] |> expect.exist()
  })
})

describe("when connection <- operate[['CreateConnection']]()",{
  it("then connection is not NA is valid configuration",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configuration |> ODBC.Storage.Broker()

    # When
    connection <- operate[['CreateConnection']]()

    # Then
    connection |> expect.not.na()
    connection |> DBI::dbDisconnect() 
  })
})

describe("when query |> operate[['ExecuteQuery']]()",{
  it("then no exception is thrown is query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configuration |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # Then
    query |> operate[['ExecuteQuery']]() |> expect.no.error()
  })
  it("then a data.frame is returned if query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configuration |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # When
    output <- query |> operate[['ExecuteQuery']]() 

    # Then
    output |> expect.data.frame()
  })
})
