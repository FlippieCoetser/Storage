describe("ODBC.Configuration.Broker",{
  it("Exist",{
    ODBC.Configuration.Broker |> expect.exist()
  })
})

describe("When operations <- ODBC.Configuration.Broker()",{
  it("then operations is a list",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains GetPresetConfig operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['GetPresetConfig']] |> expect.exist()
  })
})