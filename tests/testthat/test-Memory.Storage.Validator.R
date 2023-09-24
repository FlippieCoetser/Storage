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
  it('then validators contains IsNew validator',{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['IsNew']] |> expect.exist()
  })
})

describe("When validate[['NoImplementation']]()",{
  it("then an exceptions is thrown",{
    # Given
    validators <- Memory.Storage.Validator()
    
    expected.error <- 'Memory Storage Provider Error: ExecuteQuery not implemented.'
    
    # When
    validators[['NoImplementation']]() |> expect.error(expected.error)
  })
})

describe("When entity |> validate[['IsNew']](table)",{
  it("then an exception is thrown if entity exist in memory storage",{
    # Given
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> broker[['Seed']](table)

    validator <- broker |> Memory.Storage.Validator()

    existing.entity <- Todo.Mock.Data |> tail(1)
    
    expected.error <- 'Memory Storage Provider Error: Duplicate Id not allowed.'
    
    # Then
    existing.entity |> validator[['IsNew']](table) |> expect.error(expected.error)
  })  
})