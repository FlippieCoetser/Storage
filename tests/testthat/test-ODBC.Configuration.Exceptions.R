describe('ODBC.Configuration.Exceptions',{
  it('Exist',{
    ODBC.Configuration.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- ODBC.Configuration.Exceptions()",{
  it("then exceptions is a list",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains Config.Invalid exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Config.Invalid']] |> expect.exist()
  })
  it("then exceptions contains Configuration exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Configuration']] |> expect.exist()
  })
  it("then exceptions contains Dsn.Not.Found exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Dsn.Not.Found']] |> expect.exist()
  })
  it("then exceptions contains Driver.Not.Found exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Driver.Not.Found']] |> expect.exist()
  })
  it("then exceptions contains Server.Not.Found exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Server.Not.Found']] |> expect.exist()
  })
  it("then exceptions contains Database.Not.Found exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Database.Not.Found']] |> expect.exist()
  })
  it("then exceptions contains Uid.Not.Found exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Uid.Not.Found']] |> expect.exist()
  })
  it("then exceptions contains Pwd.Not.Found exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Pwd.Not.Found']] |> expect.exist()
  })
  it("then exceptions contains Drv.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Drv.NULL']] |> expect.exist()
  })
  it("then exceptions contains Dsn.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Dsn.NULL']] |> expect.exist()
  })
  it("then exceptions contains Driver.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Driver.NULL']] |> expect.exist()
  })
  it("then exceptions contains Server.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Server.NULL']] |> expect.exist()
  })
  it("then exceptions contains Database.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Database.NULL']] |> expect.exist()
  })
  it("then exceptions contains Uid.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()
     
    # Then
    exceptions[['Uid.NULL']] |> expect.exist()
  })
  it("then exceptions contains Pwd.NULL exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()
    
    # Then
    exceptions[['Pwd.NULL']] |> expect.exist()
  })
})

describe("When input |> exception[['Dsn.Not.Found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Dsn.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['Dsn.Not.Found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Driver.Not.Found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Driver.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['Driver.Not.Found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Server.Not.Found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Server.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['Server.Not.Found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Database.Not.Found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Database.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['Database.Not.Found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Uid.Not.Found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Uid.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['Uid.Not.Found']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Pwd.Not.Found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Pwd.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['Pwd.Not.Found']]() |> expect.error(expected.error)
  })
})

describe("When error |> exception[['Configuration']]()", {
  it("then an Dsn.Not.Found exception is thrown if error contains DSN", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DSN' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an Driver.Not.Found exception is thrown if error contains DRIVER", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DRIVER' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an Server.Not.Found exception is thrown if error contains SERVER", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'SERVER' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an Database.Not.Found exception is thrown if error contains DATABASE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DATABASE' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an Uid.Not.Found exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'UID' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an Pwd.Not.Found exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'PWD' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Drv.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Drv.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Drv.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Dsn.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Dsn.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "dsn is NULL. Valid configuration requires a dsn."

    # When
    input <- TRUE

    # Then
    input |> exception[['Dsn.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Driver.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Driver.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Driver.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Server.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Server.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Server.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Database.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Database.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "database is NULL. Valid configuration requires a database."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Database.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Uid.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Uid.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Uid.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Pwd.NULL']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Pwd.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Pwd.NULL']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Config.Invalid']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Config.Invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "Invalid ODBC configuration. Provide valid Preset or Manual configuration."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Config.Invalid']]() |> expect.error(expected.error)
  })
})