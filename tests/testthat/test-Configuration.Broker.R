describe("Configuration.Broker",{
  it("Exist",{
    Configuration.Broker() |> expect.exist()
  })
})

describe("When operations |> Configurations.Broker()",{
  it("then operations is a list",{
    # When
    operations <- Configuration.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains OpenConfigFile operation",{
    # When
    operations <- Configuration.Broker()

    # Then
    operations[['OpenConfigFile']] |> expect.exist()
  })
  it("then operations contains GetPresetConfig operation",{
    # When
    operations <- Configuration.Broker()

    # Then
    operations[['GetPresetConfig']] |> expect.exist()
  })
  it("then operations contains GetManualConfig operation",{
    # When
    operations <- Configuration.Broker()

    # Then
    operations[['GetManualConfig']] |> expect.exist()
  })
})

describe("When operation[['GetPresetConfig']]()",{
  it("then a configuration is returned",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration |> expect.exist()
  })
  it("then the configuration contains a dsn value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['dsn']] |> expect.exist()
  })
  it("then the configuration contains a uid value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then the configuration contains a pwd value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
})

describe("When operation[['GetManualConfig']]()",{
  it("then a configuration is returned",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration |> expect.exist()
  })
  it("then the configuration contains a driver value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['driver']] |> expect.exist()
  })
  it("then the configuration contains a server value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['server']] |> expect.exist()
  })
  it("then the configuration contains a database value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['database']] |> expect.exist()
  })
  it("then the configuration contains a uid value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then the configuration contains a pwd value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
})