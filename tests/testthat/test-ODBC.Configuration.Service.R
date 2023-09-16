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
})