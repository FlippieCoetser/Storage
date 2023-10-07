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
  it("then validators contains 'Model' validator",{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Model']] |> expect.exist()
  })
  it("then validators contains 'Table' validator",{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Table']] |> expect.exist()
  })
  it("then validators contains 'Data' validator",{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Data']] |> expect.exist()
  })
  it("then validators contains 'Entity' validator",{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Entity']] |> expect.exist()
  })
  it("then validators contains 'Id' validator",{
    # When
    validators <- Memory.Storage.Validator()
    
    # Then
    validators[['Id']] |> expect.exist()
  })
  it("then validators contains 'Not.Implemented' validator",{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['Not.Implemented']] |> expect.exist()
  })
  it("then validators contains 'Is.New.Entity' validator",{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['Is.New.Entity']] |> expect.exist()
  })
  it("then validators contains 'Is.Existing.Entity' validator",{
   # When
   validators <- Memory.Storage.Validator()
   
   # Then
   validators[['Is.Existing.Entity']] |> expect.exist()
  })
})

describe("When input |> validate[['Not.Implemented']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- FALSE
    
    # Then
    input |> validate[['Not.Implemented']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    validators <- Memory.Storage.Validator()
    
    expected.error <- 'Memory.Storage: Not.Implemented.'
    
    # When
    input <- TRUE

    # Then
    input |> validators[['Not.Implemented']]() |> expect.error(expected.error)
  })
})

describe("When entity |> validate[['Is.New.Entity']]()",{
  it("then no exception is thrown if entity is empty data.frame",{
    # Given
    validator <- Memory.Storage.Validator()

    # When
    empty.entity <- data.frame()
    
    # Then
    empty.entity |> validator[['Is.New.Entity']]() |> expect.no.error()
  })
  it("then an exception is thrown if entity is not empty data.frame",{
    # Given
    validator <- Memory.Storage.Validator()

    entity <- 'Task' |> Todo()
    
    expected.error <- "Memory.Storage: Key.Violation: Duplicate Primary Key not allowed."
    
    # Then
    entity |> validator[['Is.New.Entity']]() |> expect.error(expected.error)
  }) 
})

describe("When entity |> validate[['Is.Existing.Entity']]()",{
  it("then no exception is thrown if entity is not empty data.frame",{
    # Given
    validator <- Memory.Storage.Validator()

    entity <- 'Task' |> Todo()
    
    # Then
    entity |> validator[['Is.Existing.Entity']]() |> expect.no.error()
  })
  it("then an exception is thrown if entity is empty data.frame",{
    # Given
    validator <- Memory.Storage.Validator()

    empty.entity <- data.frame()
    
    expected.error <- 'Memory.Storage: Entity.Not.Found: Entity not found in storage.'
    
    # Then
    empty.entity |> validator[['Is.Existing.Entity']]() |> expect.error(expected.error)
  })
})

describe("When table |> validate[['Is.Existing.Table']]()",{
  it("then no exception is thrown if table is a valid table",{
    # Given
    table <- 'Todo'
    
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()


    Todo.Mock.Data |> broker[['Seed.Table']](table)

    validator <- broker |> Memory.Storage.Validator()

    valid.table <- table
    
    # Then
    valid.table |> validator[['Is.Existing.Table']]() |> expect.no.error()
  })
  it("then an exception is thrown if table is not a valid table",{
    # Given
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> broker[['Seed.Table']](table)

    validator <- broker |> Memory.Storage.Validator()

    invalid.table <- 'Table.Invalid'
    
    expected.error <- 'Memory.Storage: Table.Invalid: Table.Invalid is not a valid table.'
    
    # Then
    invalid.table |> validator[['Is.Existing.Table']]() |> expect.error(expected.error)
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
    
    expected.error <- "Argument.NULL: 'model' cannot not be NULL."
    
    # When
    input.model <- NULL
    
    # Then
    input.model |> validate[['Model']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if model is not a data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."
    
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
    
    expected.error <- "Argument.NULL: 'table' cannot not be NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Table']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if table is not characters",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['Table']]() |> expect.error(expected.error)
  })
})

describe("When data |> validate[['Data']]()",{
  it("then an exception is thrown if data is NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Argument.NULL: 'data' cannot not be NULL."
    
    # When
    input <- NULL
    
    # Then
    input |> validate[['Data']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if data is not data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."
    
    # When
    input <- list()
    
    # Then
    input |> validate[['Data']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if data is empty data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Rows.Invalid: Got 0 rows but expected >0 rows."
    
    # When
    input <- data.frame()
    
    # Then
    input |> validate[['Data']]() |> expect.error(expected.error)
  })
})

describe("When entity |> validate[['Entity']]()",{
  it("then an exception is thrown if entity is NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."
    
    # When
    input <- list()
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is empty data.frame",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."
    
    # When
    input <- data.frame()
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then no exception is thrown if entity is valid",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- data.frame(Id = '123', Task = 'Task', Status = 'New')
    
    # Then
    input |> validate[['Entity']]() |> expect.no.error()
  })
})

describe("When id |> validate[['Id']]()",{
  it("then an exception is thrown if id is NULL",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Argument.NULL: 'id' cannot not be NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Id']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is not characters",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['Id']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is invalid identifier",{
    # Given
    validate <- Memory.Storage.Validator()
    
    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."
    
    # When
    input <- ''
    
    # Then
    input |> validate[['Id']]() |> expect.error(expected.error)
  })
  it("then no exception is thrown if id is valid",{
    # Given
    validate <- Memory.Storage.Validator()
    
    # When
    input <- uuid::UUIDgenerate()
    
    # Then
    input |> validate[['Id']]() |> expect.no.error()
  })
})
