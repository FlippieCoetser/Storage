describe("ODBC.Storage.Validator",{
  it("Exist",{
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
  it("then validators contains Query validator",{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Query"]] |> expect.exist()
  })
  it('then validators contains Fields validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Fields"]] |> expect.exist()
  })
  it('then validators contains Entity validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Entity"]] |> expect.exist()
  })
  it('then validators contains Table validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Table"]] |> expect.exist()
  })
  it('then validators contains Id validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Id"]] |> expect.exist()
  })
  it('then validators contains NotNULL validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["NotNULL"]] |> expect.exist()
  })
  it('then validators contains IsCharacters validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["IsCharacters"]] |> expect.exist()
  })
  it('then validators contains IsDataFrame validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["IsDataFrame"]] |> expect.exist()
  })
  it('then validators contains HasOneRow validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["HasOneRow"]] |> expect.exist()
  })
  it('then validators contains Identifier validator',{
    # Given
    validators <- ODBC.Storage.Validator()

    # Then
    validators[["Identifier"]] |> expect.exist()
  })
})

describe('When query |> validate[["Query"]]()',{
  it('then query is returned if query is not null',{
    # Given
    validate <- ODBC.Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.equal(query)
  })
  it('then no exception is thrown when query is not null',{
    # Given
    validate <- ODBC.Storage.Validator()

    # When
    query <- 'SELECT 1'

    # Then
    query |> validate[["Query"]]() |> expect.no.error()
  })
  it('then an exception is thrown when query is null',{
    # Given
    validate <- ODBC.Storage.Validator()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    query <- NULL

    # Then
    query |> validate[["Query"]]() |> expect.error(expected.error)
  })
})

describe("When input |> validate[['NotNULL']](name)",{
  it("then no exception is thrown if input is not NULL",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    name  <- 'input'
    input <- ''
    
    # Then
    input |> validate[['NotNULL']](name) |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL",{
    # Given
    validate <- ODBC.Storage.Validator()

    name <- 'input'
    expected.error <- paste0('ODBC Storage Provider Error: ',name,' is NULL.')
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['NotNULL']](name) |> expect.error(expected.error)
  })
  it("then input is returned if input is not NULL",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    input <- list()
    
    expected <- input
    
    # When
    actual <- input |> validate[['NotNULL']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When input |> validate[['IsDataFrame']]()",{
  it("then no exception is thrown if input is a data.frame",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- data.frame()
 
    # Then
    input |> validate[['IsDataFrame']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is a list",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "ODBC Storage Provider Error: Invalid Type. Expected 'data.frame'."
    
    # When
    input <- list()
    
    # Then
    input |> validate[['IsDataFrame']]() |> expect.error(expected.error)
  })
  it("then input is returned if input has member",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    input    <- data.frame()
    expected <- input
    
    # When
    actual <- input |> validate[['IsDataFrame']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When input |> validate[['HasOneRow']]()",{
  it("then no exception is thrown if input has one row",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- data.frame(Id = '123')  
    
    # Then
    input |> validate[['HasOneRow']]() |> expect.no.error()
  })
  it("then an exception is thrown if input does not have one row",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "ODBC Storage Provider Error: Invalid number of rows. Expected 1 rows."
    
    # When
    input <- data.frame(Id = c('123','456'))
    
    # Then
    input |> validate[['HasOneRow']]() |> expect.error(expected.error)
  })
  it('then input is returned if input has one row',{
    # Given
    validate <- ODBC.Storage.Validator()
    
    input    <- data.frame(Id = '123')
    expected <- input
    
    # When
    actual <- input |> validate[['HasOneRow']]()
    
    # Then
    actual |> expect.equal(expected)
  })
})

describe("When entity |> validate[['Entity']]()",{
  it("then an exception is thrown if entity is NULL",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "ODBC Storage Provider Error: entity is NULL."
    
    # When
    input <- NULL 
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not data.frame",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "ODBC Storage Provider Error: Invalid Type. Expected 'data.frame'."
    
    # When
    input <- list()
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is empty data.frame",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "ODBC Storage Provider Error: Invalid number of rows. Expected 1 rows."
    
    # When
    input <- data.frame()
    
    # Then
    input |> validate[['Entity']]() |> expect.error(expected.error)
  })
  it('then no exception is thrown if entity is valid',{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- data.frame(Id = '123', Task = 'Task', Status = 'New')
    
    # Then
    input |> validate[['Entity']]() |> expect.no.error()
  })
})

describe("When input |> validate[['IsCharacters']]()",{
  it("then no exception is thrown if input is characters",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    # When
    input <- 'test'  
    
    # Then
    input |> validate[['IsCharacters']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is not characters",{
    # Given
    validate <- ODBC.Storage.Validator()
    
    expected.error <- "ODBC Storage Provider Error: Invalid Type. Expected 'character'."
    
    # When
    input <- 1
    
    # Then
    input |> validate[['IsCharacters']]() |> expect.error(expected.error)
  })
})