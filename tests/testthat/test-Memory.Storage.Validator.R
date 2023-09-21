describe('Memory.Storage.Validator',{
  it('Exist',{
    Memory.Storage.Validator |> expect.exist()
  })
})

describe("When validators <- Memory.Storage.Validator()",{
  it("then validators is a list",{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators |> expect.list()
  })
  it('then validators contains NoImplementation validator',{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['NoImplementation']] |> expect.exist()
  })
})

describe("When validate[['NoImplementation']]()",{
  it("then an exceptions is thrown",{
    # Given
    validators <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider has no ExecuteQuery implementation."
    
    # When
    validators[['NoImplementation']]() |> expect.error(expected.error)
  })
})