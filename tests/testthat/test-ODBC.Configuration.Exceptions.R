describe("ODBC.Configuration.Exceptions",{
  it("Exist",{
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
  it("then exceptions contains Configuration exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['Configuration']] |> expect.exist()
  })
  it("then exceptions contains dsnNotFound exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['dsnNotFound']] |> expect.exist()
  })
  it("then exceptions contains driverNotFound exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['driverNotFound']] |> expect.exist()
  })
  it("then exceptions contains serverNotFound exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['serverNotFound']] |> expect.exist()
  })
  it("then exceptions contains databaseNotFound exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['databaseNotFound']] |> expect.exist()
  })
  it("then exceptions contains uidNotFound exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['uidNotFound']] |> expect.exist()
  })
  it("then exceptions contains pwdNotFound exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['pwdNotFound']] |> expect.exist()
  })
  it("then exceptions contains drvIsNull exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['drvIsNull']] |> expect.exist()
  })
  it("then exceptions contains dsnIsNull exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['dsnIsNull']] |> expect.exist()
  })
  it("then exceptions contains driverIsNull exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['driverIsNull']] |> expect.exist()
  })
  it("then exceptions contains serverIsNull exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['serverIsNull']] |> expect.exist()
  })
  it("then exceptions contains databaseIsNull exception",{
    # When
    exceptions <- ODBC.Configuration.Exceptions()

    # Then
    exceptions[['databaseIsNull']] |> expect.exist()
  })
  it('then exceptions contains uidIsNull exception',{
    # When
    exceptions <- ODBC.Configuration.Exceptions()
     
    # Then
    exceptions[['uidIsNull']] |> expect.exist()
  })
  it('then exceptions contains pwdIsNull exception',{
    # When
    exceptions <- ODBC.Configuration.Exceptions()
    
    # Then
    exceptions[['pwdIsNull']] |> expect.exist()
  })
})

describe("When input |> exception[['dsnNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['dsnNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['dsnNotFound']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['driverNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['driverNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['driverNotFound']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['serverNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['serverNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['serverNotFound']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['databaseNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['databaseNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['databaseNotFound']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['uidNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['uidNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['uidNotFound']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['pwdNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['pwdNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    input <- TRUE

    # Then
    input |> exception[['pwdNotFound']]() |> expect.error(expected.error)
  })
})

describe("When error |> exception[['Configuration']]()", {
  it("then an dsnNotFound exception is thrown if error contains DSN", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DSN environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DSN' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an driverNotFound exception is thrown if error contains DRIVER", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DRIVER environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DRIVER' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an serverNotFound exception is thrown if error contains SERVER", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No SERVER environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'SERVER' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an databaseNotFound exception is thrown if error contains DATABASE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No DATABASE environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'DATABASE' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an uidNotFound exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'UID' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an pwdNotFound exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No PWD environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'PWD' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['drvIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['drvIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['drvIsNull']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['dsnIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['dsnIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "dsn is NULL. Valid configuration requires a dsn."

    # When
    input <- TRUE

    # Then
    input |> exception[['dsnIsNull']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['driverIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['driverIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['driverIsNull']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['serverIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['serverIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- ODBC.Configuration.Exceptions()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['serverIsNull']]() |> expect.error(expected.error)
  })
})