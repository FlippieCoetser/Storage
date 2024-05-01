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
  it("then operations contains open.config.file operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['open.config.file']] |> expect.exist()
  })
  it("then operations contains get.preset.config operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['get.preset.config']] |> expect.exist()
  })
  it("then operations contains get.manual.config operation",{
    # When
    operations <- ODBC.Configuration.Broker()

    # Then
    operations[['get.manual.config']] |> expect.exist()
  })
})

describe("When configuration <- operation[['get.preset.config']]()",{
  it("then configuration is a list",{
    skip_if_not(environment == 'local')
    # Given

    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.preset.config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.preset.config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains dsn parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.preset.config']]()

    # Then
    configuration[['dsn']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.preset.config']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.preset.config']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown is no DSN found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DSN environment variable not found in .Renviron Configuration file."

    cache <- 'DSN' |> environment[['get.env.variable']]()

    # When
    'DSN' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.preset.config']]() |> expect.error(expect.error)

    # Then
    'DSN' |> environment[['cache.env.variable']](cache)
  })
  it("then an exception is thrown is no UID found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No UID environment variable not found in .Renviron Configuration file."

    cache <- 'UID' |> environment[['get.env.variable']]()

    # When
    'UID' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.preset.config']]() |> expect.error(expect.error)

    # Then
    'UID' |> environment[['cache.env.variable']](cache)
  })
  it("then an exception is thrown is no PWD found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No PWD environment variable not found in .Renviron Configuration file."

    cache <- 'PWD' |> environment[['get.env.variable']]()

    # When
    'PWD' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.preset.config']]() |> expect.error(expect.error)

    # Then
    'PWD' |> environment[['cache.env.variable']](cache)
  })
})

describe("When configuration <- operation[['get.manual.config']]()",{
  it("then configuration is a list",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration |> expect.list()
  })
  it("then configuration contains drv parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration[['drv']] |> expect.exist()
  })
  it("then configuration contains driver parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration[['driver']] |> expect.exist()
  })
  it("then configuration contains server parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration[['server']] |> expect.exist()
  })
  it("then configuration contains database parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration[['database']] |> expect.exist()
  })
  it("then configuration contains uid parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration[['uid']] |> expect.exist()
  })
  it("then configuration contains pwd parameter",{
    skip_if_not(environment == 'local')
    # Given
    operations <- ODBC.Configuration.Broker()

    # When
    configuration <- operations[['get.manual.config']]()

    # Then
    configuration[['pwd']] |> expect.exist()
  })
  it("then an exception is thrown is no DRIVER found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    cache <- 'DRIVER' |> environment[['get.env.variable']]()

    # When
    'DRIVER' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.manual.config']]() |> expect.error(expect.error)

    # Then
    'DRIVER' |> environment[['cache.env.variable']](cache)
  })
  it("then an exception is thrown is no SERVER found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    cache <- 'SERVER' |> environment[['get.env.variable']]()

    # When
    'SERVER' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.manual.config']]() |> expect.error(expect.error)

    # Then
    'SERVER' |> environment[['cache.env.variable']](cache)
  })
  it("then an exception is thrown is no DATABASE found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    cache <- 'DATABASE' |> environment[['get.env.variable']]()

    # When
    'DATABASE' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.manual.config']]() |> expect.error(expect.error)

    # Then
    'DATABASE' |> environment[['cache.env.variable']](cache)
  })
  it("then an exception is thrown is no UID found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No UID environment variable not found in .Renviron Configuration file."

    cache <- 'UID' |> environment[['get.env.variable']]()

    # When
    'UID' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.manual.config']]() |> expect.error(expect.error)

    # Then
    'UID' |> environment[['cache.env.variable']](cache)
  })
  it("then an exception is thrown is no PWD found in .Renviron",{
    skip_if_not(environment == 'local')
    # Given
    environment <- Environment::Configurator()
    operation  <- ODBC.Configuration.Broker()

    expect.error <- "No PWD environment variable not found in .Renviron Configuration file."

    cache <- 'PWD' |> environment[['get.env.variable']]()

    # When
    'PWD' |> environment[['clear.env.variable']]()

    # Then
    operation[['get.manual.config']]() |> expect.error(expect.error)

    # Then
    'PWD' |> environment[['cache.env.variable']](cache)
  })
})