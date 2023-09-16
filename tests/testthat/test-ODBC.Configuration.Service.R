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