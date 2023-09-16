describe("ODBC.Configuration.Service",{
  it("Exist",{
    ODBC.Configuration.Service |> expect.exist()
  })
})

describe("When services <- broker |> ODBC.Configuration.Service()",{
  it("then services is a list",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services |> expect.list()
  })
  it("then services contains OpenConfigFile service",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['OpenConfigFile']] |> expect.function()
  })
  it("then services contains GetPresetConfig service",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['GetPresetConfig']] |> expect.function()
  })
  it("then services contains GetManualConfig service",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['GetManualConfig']] |> expect.function()
  })
})

describe("When service[['OpenConfigFile']]()",{
  it("then broker[['OpenConfigFile']]() is called once",{
    # Given
    call.count <- 0

    broker  <- ODBC.Configuration.Broker()
    broker[['OpenConfigFile']] <- \() {
      call.count <<- call.count + 1
    }
    service <- broker |> ODBC.Configuration.Service()

    before.call.count <- 0
    after.call.count  <- before.call.count + 1
    
    call.count |> expect.equal(before.call.count)

    # When
    service[['OpenConfigFile']]()

    # Then
    call.count |> expect.equal(after.call.count)
  })  
})

describe("When configuration <- service[['GetPresetConfig']]()",{
  it("then configuration is a list",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetPresetConfig']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetPresetConfig']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains dsn",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetPresetConfig']]()

    # Then
    configuration[['dsn']] |> expect.character()
  })
  it("then configuration contains uid",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetPresetConfig']]()

    # Then
    configuration[['uid']] |> expect.character()
  })
  it("then configuration contains pwd",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetPresetConfig']]()

    # Then
    configuration[['pwd']] |> expect.character()
  })
})

describe("When configuration <- service[['GetManualConfig']]()",{
  it("then configuration is a list",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains driver",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration[['driver']] |> expect.character()
  })
  it("then configuration contains server",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration[['server']] |> expect.character()
  })
  it("then configuration contains database",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration[['database']] |> expect.character()
  })
  it("then configuration contains uid",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration[['uid']] |> expect.character()
  })
  it("then configuration contains pwd",{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['GetManualConfig']]()

    # Then
    configuration[['pwd']] |> expect.character()
  })
})