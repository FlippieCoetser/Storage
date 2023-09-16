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

describe("When configuration <- operation[['GetPresetConfig']]()",{
  it("then configuration is a list",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains dsn parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['dsn']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
})