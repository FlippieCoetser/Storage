describe('Memory.Storage.Validation',{
  it('Exist',{
    Memory.Storage.Validation |> expect.exist()
  })
})

describe("When validators <- Memory.Storage.Validation()",{
  it("then validators is a list",{
    # When
    validators <- Memory.Storage.Validation()
    
    # Then
    validators |> expect.list()
  })
})