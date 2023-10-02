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
  it("then operations contains Open.Config.File operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['Open.Config.File']] |> expect.exist()
  })
  it("then operations contains Get.Preset.Config operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['Get.Preset.Config']] |> expect.exist()
  })
  it("then operations contains Get.Manual.Config operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['Get.Manual.Config']] |> expect.exist()
  })
})

describe("When configuration <- operation[['Get.Preset.Config']]()",{
  it("then configuration is a list",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains dsn parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['dsn']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown is no DSN found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    'DSN' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Preset.Config']]() |> expect.error(expect.error)

    # Then
    'DSN' |> environment[['Cache.Env.Variable']]('DSN')
  })
  it("then an exception is thrown is no UID found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    'UID' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Preset.Config']]() |> expect.error(expect.error)

    # Then
    'UID' |> environment[['Cache.Env.Variable']]('UID')
  })
  it("then an exception is thrown is no PWD found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    'PWD' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Preset.Config']]() |> expect.error(expect.error)

    # Then
    'PWD' |> environment[['Cache.Env.Variable']]('PWD')
  })
})

describe("When configuration <- operation[['Get.Manual.Config']]()",{
  it("then configuration is a list",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains driver parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['driver']] |> expect.exist()
  })
  it("then configuration contains server parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['server']] |> expect.exist()
  })
  it("then configuration contains database parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['database']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown is no DRIVER found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    'DRIVER' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'DRIVER' |> environment[['Cache.Env.Variable']]('DRIVER')
  })
  it("then an exception is thrown is no SERVER found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    'SERVER' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'SERVER' |> environment[['Cache.Env.Variable']]('SERVER')
  })
  it("then an exception is thrown is no DATABASE found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    'DATABASE' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'DATABASE' |> environment[['Cache.Env.Variable']]('DATABASE')
  })
  it("then an exception is thrown is no UID found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    'UID' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'UID' |> environment[['Cache.Env.Variable']]('UID')
  })
  it("then an exception is thrown is no PWD found in .Renviron",{
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    'PWD' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'PWD' |> environment[['Cache.Env.Variable']]('PWD')
  })
})