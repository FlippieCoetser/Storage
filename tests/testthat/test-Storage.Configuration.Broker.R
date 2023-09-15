describe("Storage.Configuration.Broker",{
  it("Exist",{
    Storage.Configuration.Broker() |> expect.exist()
  })
})

describe("When operations |> Configurations.Broker()",{
  it("then operations is a list",{
    # When
    operations <- Storage.Configuration.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains OpenConfigFile operation",{
    # When
    operations <- Storage.Configuration.Broker()

    # Then
    operations[['OpenConfigFile']] |> expect.exist()
  })
  it("then operations contains GetPresetConfig operation",{
    # When
    operations <- Storage.Configuration.Broker()

    # Then
    operations[['GetPresetConfig']] |> expect.exist()
  })
  it("then operations contains GetManualConfig operation",{
    # When
    operations <- Storage.Configuration.Broker()

    # Then
    operations[['GetManualConfig']] |> expect.exist()
  })
})

describe("When operation[['GetPresetConfig']]()",{
  it("then a configuration is returned",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration |> expect.exist()
  })
  it("then the configuration contains a dsn value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['dsn']] |> expect.exist()
  })
  it("then the configuration contains a uid value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then the configuration contains a pwd value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetPresetConfig']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown when DSN is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:DSN. Please check .Renviron configuration file."
   
    # When
    'DSN' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetPresetConfig']]() |> expect.error(expected.error)

    'DSN' |> utility[['CacheEnvVariable']]('DSN')
  })
  it("then an exception is thrown when UID is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:UID. Please check .Renviron configuration file."
   
    # When
    'UID' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetPresetConfig']]() |> expect.error(expected.error)

    'UID' |> utility[['CacheEnvVariable']]('UID')
  })
  it("then an exception is thrown when PWD is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:PWD. Please check .Renviron configuration file."
   
    # When
    'PWD' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetPresetConfig']]() |> expect.error(expected.error)

    'PWD' |> utility[['CacheEnvVariable']]('PWD')
  })
})

describe("When operation[['GetManualConfig']]()",{
  it("then a configuration is returned",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration |> expect.exist()
  })
  it("then the configuration contains a driver value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['driver']] |> expect.exist()
  })
  it("then the configuration contains a server value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['server']] |> expect.exist()
  })
  it("then the configuration contains a database value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['database']] |> expect.exist()
  })
  it("then the configuration contains a uid value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then the configuration contains a pwd value",{
    # Given
    operations <- Storage.Configuration.Broker()

    # When
    configuration <- operations[['GetManualConfig']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown when DRIVER is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:DRIVER. Please check .Renviron configuration file."
   
    # When
    'DRIVER' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetManualConfig']]() |> expect.error(expected.error)

    'DRIVER' |> utility[['CacheEnvVariable']]('DRIVER')
  })
  it("then an exception is thrown when SERVER is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:SERVER. Please check .Renviron configuration file."
   
    # When
    'SERVER' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetManualConfig']]() |> expect.error(expected.error)

    'SERVER' |> utility[['CacheEnvVariable']]('SERVER')
  })
  it("then an exception is thrown when DATABASE is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:DATABASE. Please check .Renviron configuration file."
   
    # When
    'DATABASE' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetManualConfig']]() |> expect.error(expected.error)

    'DATABASE' |> utility[['CacheEnvVariable']]('DATABASE')
  })
  it("then an exception is thrown when UID is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:UID. Please check .Renviron configuration file."
   
    # When
    'UID' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetManualConfig']]() |> expect.error(expected.error)

    'UID' |> utility[['CacheEnvVariable']]('UID')
  })
  it("then an exception is thrown when PWD is not set",{
    # Given
    utility <- Environment::Environment()
    operation <- Storage.Configuration.Broker()

    expected.error <- "No value found for provided environment variable:PWD. Please check .Renviron configuration file."
   
    # When
    'PWD' |> utility[['ClearEnvVariable']]()

    # Then
    operation[['GetManualConfig']]() |> expect.error(expected.error)

    'PWD' |> utility[['CacheEnvVariable']]('PWD')
  })
})