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
  it("then an uidNotFound exception is thrown if error contains UID", {
    # Given
    exception <- ODBC.Configuration.Exceptions()

    expected.error <- "No UID environment variable not found in .Renviron Configuration file."

    # When
    configuration.error <- 'UID' 

    # Then
    configuration.error |> exception[['Configuration']]() |> expect.error(expected.error)
  })
})