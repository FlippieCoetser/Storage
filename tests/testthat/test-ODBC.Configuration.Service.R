describe('ODBC.Configuration.Service',{
  it('Exist',{
    ODBC.Configuration.Service |> expect.exist()
  })
})

describe('When services <- broker |> ODBC.Configuration.Service()',{
  it('then services is a list',{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services |> expect.list()
  })
  it('then services contains Open.Config.File service',{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['Open.Config.File']] |> expect.function()
  })
  it('then services contains Get.Preset.Config service',{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['Get.Preset.Config']] |> expect.function()
  })
  it('then services contains Get.Manual.Config service',{
    # When
    services <- ODBC.Configuration.Service()

    # Then
    services[['Get.Manual.Config']] |> expect.function()
  })
})

describe("When service[['Open.Config.File']]()",{
  it("then broker[['Open.Config.File']]() is called once",{
    # Given
    call.count <- 0

    broker  <- ODBC.Configuration.Broker()
    broker[['Open.Config.File']] <- \() {
      call.count <<- call.count + 1
    }
    service <- broker |> ODBC.Configuration.Service()

    before.call.count <- 0
    after.call.count  <- before.call.count + 1
    
    call.count |> expect.equal(before.call.count)

    # When
    service[['Open.Config.File']]()

    # Then
    call.count |> expect.equal(after.call.count)
  })  
})

describe("When configuration <- service[['Get.Preset.Config']]()",{
  it('then configuration is a list',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Preset.Config']]()

    # Then
    configuration |> expect.list()
  })
  it('then configuration contains drv',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Preset.Config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it('then configuration contains dsn',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Preset.Config']]()

    # Then
    configuration[['dsn']] |> expect.character()
  })
  it('then configuration contains uid',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Preset.Config']]()

    # Then
    configuration[['uid']] |> expect.character()
  })
  it('then configuration contains pwd',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Preset.Config']]()

    # Then
    configuration[['pwd']] |> expect.character()
  })
})

describe("When configuration <- service[['Get.Manual.Config']]()",{
  it('then configuration is a list',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration |> expect.list()
  })
  it('then configuration contains drv',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it('then configuration contains driver',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration[['driver']] |> expect.character()
  })
  it('then configuration contains server',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration[['server']] |> expect.character()
  })
  it('then configuration contains database',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration[['database']] |> expect.character()
  })
  it('then configuration contains uid',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration[['uid']] |> expect.character()
  })
  it('then configuration contains pwd',{
    # Given
    broker  <- ODBC.Configuration.Broker()
    service <- broker |> ODBC.Configuration.Service()

    # When
    configuration <- service[['Get.Manual.Config']]()

    # Then
    configuration[['pwd']] |> expect.character()
  })
})