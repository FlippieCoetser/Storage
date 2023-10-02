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
  it("then operations contains Create.Connection operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Create.Connection']] |> expect.exist()
  })
  it("then operations contains Execute.Query operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Execute.Query']] |> expect.exist()
  })
})

describe("when connection <- operate[['Create.Connection']]()",{
  it("then connection is not NA is valid configuration",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configuration |> ODBC.Storage.Broker()

    # When
    connection <- operate[['Create.Connection']]()

    # Then
    connection |> expect.not.na()
    connection |> DBI::dbDisconnect() 
  })
})

describe("when query |> operate[['Execute.Query']]()",{
  it("then no exception is thrown is query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configuration |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # Then
    query |> operate[['Execute.Query']]() |> expect.no.error()
  })
  it("then a data.frame is returned if query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configuration |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # When
    output <- query |> operate[['Execute.Query']]() 

    # Then
    output |> expect.data.frame()
  })
})
