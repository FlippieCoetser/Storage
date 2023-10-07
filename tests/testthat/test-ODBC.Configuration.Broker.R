describe('ODBC.Configuration.Broker',{
  it('Exist',{
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
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains dsn parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['dsn']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Preset.Config']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown is no DSN found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DSN environment variable not found in .Renviron Configuration file."

    cache <- 'DSN' |> environment[['Get.Env.Variable']]()

    # When
    'DSN' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Preset.Config']]() |> expect.error(expect.error)

    # Then
    'DSN' |> environment[['Cache.Env.Variable']](cache)
  })
  it("then an exception is thrown is no UID found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No UID environment variable not found in .Renviron Configuration file."

    cache <- 'UID' |> environment[['Get.Env.Variable']]()

    # When
    'UID' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Preset.Config']]() |> expect.error(expect.error)

    # Then
    'UID' |> environment[['Cache.Env.Variable']](cache)
  })
  it("then an exception is thrown is no PWD found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No PWD environment variable not found in .Renviron Configuration file."

    cache <- 'PWD' |> environment[['Get.Env.Variable']]()

    # When
    'PWD' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Preset.Config']]() |> expect.error(expect.error)

    # Then
    'PWD' |> environment[['Cache.Env.Variable']](cache)
  })
})

describe("When configuration <- operation[['Get.Manual.Config']]()",{
  it("then configuration is a list",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains driver parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['driver']] |> expect.exist()
  })
  it("then configuration contains server parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['server']] |> expect.exist()
  })
  it("then configuration contains database parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['database']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['Get.Manual.Config']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown is no DRIVER found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    cache <- 'DRIVER' |> environment[['Get.Env.Variable']]()

    # When
    'DRIVER' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'DRIVER' |> environment[['Cache.Env.Variable']](cache)
  })
  it("then an exception is thrown is no SERVER found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    cache <- 'SERVER' |> environment[['Get.Env.Variable']]()

    # When
    'SERVER' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'SERVER' |> environment[['Cache.Env.Variable']](cache)
  })
  it("then an exception is thrown is no DATABASE found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    cache <- 'DATABASE' |> environment[['Get.Env.Variable']]()

    # When
    'DATABASE' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'DATABASE' |> environment[['Cache.Env.Variable']](cache)
  })
  it("then an exception is thrown is no UID found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No UID environment variable not found in .Renviron Configuration file."

    cache <- 'UID' |> environment[['Get.Env.Variable']]()

    # When
    'UID' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'UID' |> environment[['Cache.Env.Variable']](cache)
  })
  it("then an exception is thrown is no PWD found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Environment()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No PWD environment variable not found in .Renviron Configuration file."

    cache <- 'PWD' |> environment[['Get.Env.Variable']]()

    # When
    'PWD' |> environment[['Clear.Env.Variable']]()

    # Then
    operation[['Get.Manual.Config']]() |> expect.error(expect.error)

    # Then
    'PWD' |> environment[['Cache.Env.Variable']](cache)
  })
})