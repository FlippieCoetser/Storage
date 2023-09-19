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
})