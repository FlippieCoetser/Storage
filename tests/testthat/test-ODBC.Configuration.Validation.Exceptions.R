describe('ODBC.Configuration.Validation.Exceptions',{
  it('Exist',{
    ODBC.Configuration.Validation.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- ODBC.Configuration.Validation.Exceptions()",{
  it("then exceptions is a list",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains config.invalid exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['config.invalid']] |> expect.exist()
  })
  it("then exceptions contains Configuration exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['Configuration']] |> expect.exist()
  })
  it("then exceptions contains DSN.not.found exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['DSN.not.found']] |> expect.exist()
  })
  it("then exceptions contains DRIVER.not.found exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['DRIVER.not.found']] |> expect.exist()
  })
  it("then exceptions contains SERVER.not.found exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['SERVER.not.found']] |> expect.exist()
  })
  it("then exceptions contains DATABASE.not.found exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['DATABASE.not.found']] |> expect.exist()
  })
  it("then exceptions contains UID.not.found exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['UID.not.found']] |> expect.exist()
  })
  it("then exceptions contains PWD.not.found exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['PWD.not.found']] |> expect.exist()
  })
  it("then exceptions contains drv.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['drv.NULL']] |> expect.exist()
  })
  it("then exceptions contains driver.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['driver.NULL']] |> expect.exist()
  })
  it("then exceptions contains dsn.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['dsn.NULL']] |> expect.exist()
  })
  it("then exceptions contains server.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['server.NULL']] |> expect.exist()
  })
  it("then exceptions contains database.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()

    # Then
    exceptions[['database.NULL']] |> expect.exist()
  })
  it("then exceptions contains uid.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()
     
    # Then
    exceptions[['uid.NULL']] |> expect.exist()
  })
  it("then exceptions contains pwd.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Validation.Exceptions()
    
    # Then
    exceptions[['pwd.NULL']] |> expect.exist()
  })
})

describe("When input |> exception[['DSN.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['DSN.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['DSN.not.found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['DRIVER.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['DRIVER.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['DRIVER.not.found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['SERVER.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['SERVER.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['SERVER.not.found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['DATABASE.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['DATABASE.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['DATABASE.not.found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['UID.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['UID.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['UID.not.found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['PWD.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['PWD.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['PWD.not.found']]() |> expect.error(expected.error)
  })
})

describe("When error |> exception[['Configuration']]()", {
  it("then an DSN.not.found exception is thrown if error contains DSN", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DSN' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an DRIVER.not.found exception is thrown if error contains DRIVER", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DRIVER' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an SERVER.not.found exception is thrown if error contains SERVER", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'SERVER' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an DATABASE.not.found exception is thrown if error contains DATABASE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DATABASE' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an UID.not.found exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'UID' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an PWD.not.found exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'PWD' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['config.invalid']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['config.invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    expected.error <- "Invalid ODBC configuration. Provide valid Preset or Manual configuration."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['config.invalid']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['drv.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['drv.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "drv is NULL. Valid configuration requires a drv."

    # When
    input <- TRUE

    # Then
    input |> exception[['drv.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['dsn.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['dsn.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()

    expected.error <- "dsn is NULL. Valid configuration requires a dsn."

    # When
    input <- TRUE

    # Then
    input |> exception[['dsn.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['driver.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['driver.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['driver.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['server.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['server.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['server.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['database.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['database.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    expected.error <- "database is NULL. Valid configuration requires a database."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['database.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['uid.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['uid.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['uid.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['pwd.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['pwd.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Validation.Exceptions()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['pwd.NULL']]() |> expect.error(expected.error)
  })
})

