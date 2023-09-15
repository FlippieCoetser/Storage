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
  it("then the configuration contains a DSN value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['DSN']] |> expect.exist()
  })
  it("then the configuration contains a UID value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['UID']] |> expect.exist()
  })
  it("then the configuration contains a PWD value",{
    # Given
    operations <- Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['PWD']] |> expect.exist()
  })
})