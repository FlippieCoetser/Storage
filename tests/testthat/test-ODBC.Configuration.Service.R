describe('ODBC.Configuration.Service',{
  it('Exist',{
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
  it("then services contains open.config.file service",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['open.config.file']] |> expect.function()
  })
  it("then services contains get.preset.config service",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['get.preset.config']] |> expect.function()
  })
  it("then services contains get.manual.config service",{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['get.manual.config']] |> expect.function()
  })
})

describe("When service[['open.config.file']]()",{
  it("then broker[['open.config.file']]() is called once",{
    # Given
    call.count <- 0

    broker  <- ODBC.Configuration.Broker()
    broker[['open.config.file']] <- \() {
      call.count <<- call.count + 1
    }
    service <- broker |> ODBC.Configuration.Service()

    before.call.count <- 0
    after.call.count  <- before.call.count + 1
    
    call.count |> expect.equal(before.call.count)

    # When
    service[['open.config.file']]()

    # Then
    call.count |> expect.equal(after.call.count)
  })  
})

describe("When configuration <- service[['get.preset.config']]()",{
  it("then configuration is a list",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.preset.config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.preset.config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains dsn",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.preset.config']]()

    # Then
    configuration[['dsn']] |> expect.character()
  })
  it("then configuration contains uid",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.preset.config']]()

    # Then
    configuration[['uid']] |> expect.character()
  })
  it("then configuration contains pwd",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.preset.config']]()

    # Then
    configuration[['pwd']] |> expect.character()
  })
})

describe("When configuration <- service[['get.manual.config']]()",{
  it("then configuration is a list",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains driver",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration[['driver']] |> expect.character()
  })
  it("then configuration contains server",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration[['server']] |> expect.character()
  })
  it("then configuration contains database",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration[['database']] |> expect.character()
  })
  it("then configuration contains uid",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration[['uid']] |> expect.character()
  })
  it("then configuration contains pwd",{
    skip_if_not(environment == 'local')
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['get.manual.config']]()

    # Then
    configuration[['pwd']] |> expect.character()
  })
})