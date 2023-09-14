describe("Storage.Validator",{
  it("Exist",{
    Storage.Validator |> expect.exist()
  })
})

describe("When validators <- Storage.Validator()",{
  it("then validators a list",{
    # Given
    validators <- Storage.Validator()

    # Then
    validators |> expect.list()
  })
  it("then validators contains Query validator",{
    # Given
    validators <- Storage.Validator()

    # Then
    validators[["Query"]] |> expect.exist()
  })
})

describe('When query |> validate[["Query"]]()',{
  it('then query is returned if query is not null',{
    # Given
    validate <- Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.equal(query)
  })
  it('then no exception is thrown when query is not null',{
    # Given
    validate <- Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.no.error()
  })
  it('then an exception is thrown when query is null',{
    # Given
    validate <- Storage.Validator()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> validate[["Query"]]() |> expect.error(expected.error)
  })
})
