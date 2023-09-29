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
  it('then validators contains NotNULL validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['NotNULL']] |> expect.exist()
  })
  it('then validators contains IsDataFrame validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['IsDataFrame']] |> expect.exist()
  })
  it('then validators contains IsCharacters validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['IsCharacters']] |> expect.exist()
  })
  it('then validators contains IsEmpty validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['IsEmpty']] |> expect.exist()
  })
  it('then validators contains NotEmpty validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['NotEmpty']] |> expect.exist()
  })
  it('then validators contains Model validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Model']] |> expect.exist()
  })
  it('then validators contains Table validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Table']] |> expect.exist()
  })
  it('then validators contains Data validator',{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Data']] |> expect.exist()
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

describe("When input |> validate[['NotNULL']](name)",{
  it("then no exception is thrown if input is not NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    name  <- 'input'
    input <- ''
    
    # Then
    input |> validate[['NotNULL']](name) |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL",{
    # Given
    validate <- Memory.Storage.Validator()

    name <- 'input'
    expected.error <- paste0('Memory Storage Provider Error: ',name,' is NULL.')
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['NotNULL']](name) |> expect.error(expected.error)
  })
  it("then input is returned if input is not NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    input <- list()
    
    expected <- input
    
    # When
    actual <- input |> validate[['NotNULL']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When input |> validate[['NotEmpty']]()",{
  it("then no exception is thrown if input is not empty",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- data.frame(Id = '123')
    
    # Then
    input |> validate[['NotEmpty']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is empty",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- 'Memory Storage Provider Error: Invalid number of rows. Expected >0 rows.'
    
    # When
    input <- data.frame()
    
    # Then
    input |> validate[['NotEmpty']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is not empty",{
    # Given
    validate <- Memory.Storage.Validator()
    
    input    <- data.frame(Id = '123')
    expected <- input
    
    # When
    actual <- input |> validate[['NotEmpty']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When input |> validate[['IsDataFrame']]()",{
  it("then no exception is thrown if input is a data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- data.frame()
 
    # Then
    input |> validate[['IsDataFrame']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'data.frame'."
    
    # When
    input <- list()
    
    # Then
    input |> validate[['IsDataFrame']]() |> expect.error(expected.error)
  })
  it("then input is returned if input has member",{
    # Given
    validate <- Memory.Storage.Validator()
    
    input    <- data.frame()
    expected <- input
    
    # When
    actual <- input |> validate[['IsDataFrame']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When input |> validate[['IsCharacters']]()",{
  it("then no exception is thrown if input is characters",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- 'test'  
    
    # Then
    input |> validate[['IsCharacters']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not characters",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['IsCharacters']]() |> expect.error(expected.error)
  })
  it("then input is returned if input has member",{
    # Given
    validate <- Memory.Storage.Validator()
    
    input    <- 'test'
    expected <- input
    
    # When
    actual <- input |> validate[['IsCharacters']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When input |> validate[['IsEmpty']]()",{
  it("then no exception is thrown if input is empty data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- data.frame()

    # Then
    input |> validate[['IsEmpty']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not empty data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: Invalid number of rows. Expected 0 rows."
    
    # When
    input <- data.frame(Id = '123')
    
    # Then
    input |> validate[['IsEmpty']]() |> expect.error(expected.error)
  })
  it("then input is returned if input is empty data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    input    <- data.frame()
    expected <- input
    
    # When
    actual <- input |> validate[['IsEmpty']]()
    
    # Then
    actual |> expect.equal(expected)
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

describe("When model |> validate[['Model']]()",{
  it("then no exception is thrown if model is a data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input.model <- data.frame()
    
    # Then
    input.model |> validate[['Model']]() |> expect.no.error()
  })
  it("then no exception if thrown if model is a data.frame with 0 rows",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input.model <- data.frame(Id = character(0), Task = character(0), Status = character(0))
    
    # Then
    input.model |> validate[['Model']]() |> expect.no.error()
  })
  it("then an exception if thrown if model is NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    variable <- 'Model'
    expected.error <- 'Memory Storage Provider Error: model is NULL.'
    
    # When
    input.model <- NULL
    
    # Then
    input.model |> validate[['Model']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if model is not a data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'data.frame'."
    
    # When
    input.model <- list()
    
    # Then
    input.model |> validate[['Model']]() |> expect.error(expected.error)
  })
  it("then model is returned if model is valid",{
    # Given
    validate <- Memory.Storage.Validator()
    
    input.model <- data.frame(Id = character(0), Task = character(0), Status = character(0))
    expected.model <- input.model
    
    # When
    actual.model <- input.model |> validate[['Model']]()
    
    # Then
    actual.model |> expect.equal(expected.model)
  })
})

describe("When table |> validate[['Table']]()",{
  it("then no exception if thrown if table is valid",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- 'test'  
    
    # Then
    input |> validate[['Table']]() |> expect.no.error()
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: table is NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Table']]() |> expect.error(expected.error)
  })
  it('then an exception if thrown if table is not characters',{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['Table']]() |> expect.error(expected.error)
  })
})

describe("When data |> validate[['Data']]()",{
  it('then an exception is thrown if data is NULL',{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Memory Storage Provider Error: data is NULL."
    
    # When
    input <- NULL
    
    # Then
    input |> validate[['Data']]() |> expect.error(expected.error)
  })
})