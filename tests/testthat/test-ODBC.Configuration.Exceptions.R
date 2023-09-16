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
})
