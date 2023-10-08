describe('ODBC.Storage.Validator',{
  it('Exist',{
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
  it("then validators contains 'Query' validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Query"]] |> expect.exist()
  })
  it("then validators contains 'Fields' validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Fields"]] |> expect.exist()
  })
  it("then validators contains 'Entity' validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Entity"]] |> expect.exist()
  })
  it("then validators contains 'Table' validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Table"]] |> expect.exist()
  })
  it("then validators contains 'Id' validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Id"]] |> expect.exist()
  })
  it("then validators contains 'Is.Existing.Table' validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Is.Existing.Table"]] |> expect.exist()
  })
})

describe("When query |> validate[['Query']]()",{
  it("then query is returned if query is not null",{
    # Given
    validate <- ODBC.Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.equal(query)
  })
  it("then no exception is thrown when query is not null",{
    # Given
    validate <- ODBC.Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.no.error()
  })
  it("then an exception is thrown when query is null",{
    # Given
    validate <- ODBC.Storage.Validator()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> validate[["Query"]]() |> expect.error(expected.error)
  })
})

describe("When entity |> validate[['Entity']]()",{
  it("then an exception is thrown if entity is NULL",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not data.frame",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."
    
    # When
    input <- list()
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is empty data.frame",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."
    
    # When
    input <- data.frame()
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then no exception is thrown if entity is valid",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- data.frame(Id = '123', Task = 'Task', Status = 'New')
    
    # Then
    input |> validate[['Entity']]() |> expect.no.error()
  })
})

describe("When table |> validate[['Table']]()",{
  it("then no exception if thrown if table is valid",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- 'test'  
    
    # Then
    input |> validate[['Table']]() |> expect.no.error()
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Argument.NULL: 'table' cannot not be NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Table']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if table is not characters",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['Table']]() |> expect.error(expected.error)
  })
})

describe("When id |> validate[['Id']]()",{
  it("then an exception is thrown if id is NULL",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Argument.NULL: 'id' cannot not be NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Id']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is not characters",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['Id']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is invalid identifier",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."
    
    # When
    input <- ''
    
    # Then
    input |> validate[['Id']]() |> expect.error(expected.error)
  })
  it("then no exception is thrown if id is valid",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- uuid::UUIDgenerate()
    
    # Then
    input |> validate[['Id']]() |> expect.no.error()
  })
})

describe("When table |> validate[['Is.Existing.Table']](name)",{
  it("then no exception is thrown if table is not empty data.frame",{
    # Given
    validator <- ODBC.Storage.Validator()

    table <- data.frame(name = 'Todo')
    
    # Then
    table |> validator[['Is.Existing.Table']]() |> expect.no.error()
  })
  it("then an exception is thrown if table is empty data.frame",{
    # Given
    validator <- ODBC.Storage.Validator()

    empty.table <- data.frame()
    name <- 'Invalid'
    
    expected.error <- 'ODBC.Storage: Table.Invalid: Invalid is not a valid table.'
    
    # Then
    empty.table |> validator[['Is.Existing.Table']](name) |> expect.error(expected.error)
  })
})