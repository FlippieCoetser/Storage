describe('ODBC.Configuration.Validator',{
  it('Exist',{
    ODBC.Configuration.Validator |> expect.exist()
  })
})

describe("When validators <- ODBC.Configuration.Validator()",{
  it("then validators is a list",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators |> expect.list()
  })
  it("then validators contains HasDrv validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDrv']] |> expect.exist()
  })
  it("then validators contains HasDsn validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDsn']] |> expect.exist()
  })
  it("then validators contains HasDriver validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDriver']] |> expect.exist()
  })
  it("then validators contains HasServer validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasServer']] |> expect.exist()
  })
  it("then validators contains HasDatabase validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDatabase']] |> expect.exist()
  })
  it("then validators contains HasUid validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasUid']] |> expect.exist()
  })
})