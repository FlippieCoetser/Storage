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