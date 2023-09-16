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