describe("ODBC.Storage.Validator",{
  it("Exist",{
    ODBC.Storage.Validator |> expect.exist()
  })
})

describe("When validators <- ODBC.Storage.Validator()",{
  it("then validators a list",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators |> expect.list()
  })
  it("then validators contains Query validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Query"]] |> expect.exist()
  })
  it('then validators contains Entity validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Entity"]] |> expect.exist()
  })
})

describe('When query |> validate[["Query"]]()',{
  it('then query is returned if query is not null',{
    # Given
    validate <- ODBC.Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.equal(query)
  })
  it('then no exception is thrown when query is not null',{
    # Given
    validate <- ODBC.Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.no.error()
  })
  it('then an exception is thrown when query is null',{
    # Given
    validate <- ODBC.Storage.Validator()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> validate[["Query"]]() |> expect.error(expected.error)
  })
})
