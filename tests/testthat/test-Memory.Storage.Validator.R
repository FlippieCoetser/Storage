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
  it('then validators contains Model validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Model']] |> expect.exist()
  })
  })
  it('then validators contains NoImplementation validator',{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['NoImplementation']] |> expect.exist()
  })
  it('then validators contains IsNewEntity validator',{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['IsNewEntity']] |> expect.exist()
  })
  it('then validators contains EntityExist validator',{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['EntityExist']] |> expect.exist()
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

describe("When entity |> validate[['IsNewEntity']](table)",{
  it("then an exception is thrown if entity exist in memory storage",{
    # Given
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> broker[['SeedTable']](table)

    validator <- broker |> Memory.Storage.Validator()

    existing.entity <- Todo.Mock.Data |> tail(1)
    
    expected.error <- 'Memory Storage Provider Error: Duplicate Id not allowed.'
    
    # Then
    existing.entity |> validator[['IsNewEntity']](table) |> expect.error(expected.error)
  })  
})

describe("When entity |> validate[['EntityExist']](table)",{
  it("then an exception is thrown if entity does not exist in memory storage",{
    # Given
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> broker[['SeedTable']](table)

    validator <- broker |> Memory.Storage.Validator()

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    
    expected.error <- 'Memory Storage Provider Error: Entity not found.'
    
    # Then
    new.entity |> validator[['EntityExist']](table) |> expect.error(expected.error)
  })  
})

describe("When table |> validate[['IsValidTable']]()",{
  it("then no exception is thrown if table is a valid table",{
    # Given
    table <- 'Todo'
    
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()


    Todo.Mock.Data |> broker[['SeedTable']](table)

    validator <- broker |> Memory.Storage.Validator()

    valid.table <- table
    
    # Then
    valid.table |> validator[['IsValidTable']]() |> expect.no.error()
  })
  it("then an exception is thrown if table is not a valid table",{
    # Given
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> broker[['SeedTable']](table)

    validator <- broker |> Memory.Storage.Validator()

    invalid.table <- 'InvalidTable'
    
    expected.error <- 'Memory Storage Provider Error: InvalidTable is not a valid table.'
    
    # Then
    invalid.table |> validator[['IsValidTable']]() |> expect.error(expected.error)
  })
})