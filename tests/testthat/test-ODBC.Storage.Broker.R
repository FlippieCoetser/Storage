describe("ODBC.Storage.Broker",{
  it("Exist",{
    ODBC.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- configuration |> ODBC.Storage.Broker()",{
  it("then operations is a list",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    # When
    operations <- configuration |> ODBC.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains CreateConnection operation",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    # When
    operations <- configuration |> ODBC.Storage.Broker()

    # Then
    operations[['CreateConnection']] |> expect.exist()
  })
  it("then operations contains ExecuteQuery operation",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    # When
    operations <- configuration |> ODBC.Storage.Broker()

    # Then
    operations[['ExecuteQuery']] |> expect.exist()
  })
})

describe("when connection <- operate[['CreateConnection']]()",{
  it("then connection is not NA is valid configuration",{
    skip_if_not(environment == 'local')
    # Given
    configurator  <- Storage.Configuration.Broker() |> Storage.Configuration.Service()
    configuration <- configurator[["GetPresetConfig"]]()

    operate <- configuration |> ODBC.Storage.Broker()

    # When
    connection <- operate[['CreateConnection']]()

    # Then
    connection |> expect.not.na()
    connection |> DBI::dbDisconnect() 
  })
  it("then an exception is thrown if configuration has invalid DSN",{
    skip_if_not(environment == 'local')
    # Given
    configurator  <- Storage.Configuration.Broker() |> Storage.Configuration.Service()
    configuration <- configurator[["GetPresetConfig"]]()

    configuration[['dsn']] <- "Invalid"

    operate <- configuration |> ODBC.Storage.Broker()

    expected.error <- "ODBC Driver: Invalid DSN"

    # Then
    operate[['CreateConnection']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has invalid UID",{
    skip_if_not(environment == 'local')
    # Given
    configurator  <- Storage.Configuration.Broker() |> Storage.Configuration.Service()
    configuration <- configurator[["GetPresetConfig"]]()

    configuration[['uid']] <- "Invalid"

    operate <- configuration |> ODBC.Storage.Broker()

    expected.error <- "ODBC Driver: Login Failed, check credentials"

    # Then
    operate[['CreateConnection']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has invalid PWD",{
    skip_if_not(environment == 'local')
    # Given
    configurator  <- Storage.Configuration.Broker() |> Storage.Configuration.Service()
    configuration <- configurator[["GetPresetConfig"]]()

    configuration[['pwd']] <- "Invalid"

    operate <- configuration |> ODBC.Storage.Broker()

    expected.error <- "ODBC Driver: Login Failed, check credentials"

    # Then
    operate[['CreateConnection']]() |> expect.error(expected.error)
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
