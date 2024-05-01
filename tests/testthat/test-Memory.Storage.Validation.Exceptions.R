describe('Memory.Storage.Validation.Exceptions',{
  it('Exist',{
    Memory.Storage.Validation.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Memory.Storage.Validation.Exceptions()",{
  it("then exceptions is a list",{
    # When
    exceptions <- Memory.Storage.Validation.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains 'not.implemented' exception",{
   # When
   exceptions <- Memory.Storage.Validation.Exceptions()
   
   # Then
   exceptions[['not.implemented']] |> expect.exist()
  })
  it("then exceptions contains 'key.violation' exception",{
   # When
   exceptions <- Memory.Storage.Validation.Exceptions()
   
   # Then
   exceptions[['key.violation']] |> expect.exist()
  })
  it("then exceptions contains 'entity.not.found' exception",{
   # When
   exceptions <- Memory.Storage.Validation.Exceptions()
   
   # Then
   exceptions[['entity.not.found']] |> expect.exist()
  })
  it("then exceptions contains 'table.invalid' exception",{
   # When
   exceptions <- Memory.Storage.Validation.Exceptions()
   
   # Then
   exceptions[['table.invalid']] |> expect.exist()
  })
})

describe("When input |> exception[['not.implemented']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['not.implemented']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    expected.error <- 'Memory.Storage: not.implemented.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['not.implemented']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['key.violation']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['key.violation']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    expected.error <- "Memory.Storage: key.violation: Duplicate Primary Key not allowed."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['key.violation']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['table.invalid']](table)", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['table.invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()

    invalid.table <- 'Invalid Table'
    
    expected.error <- paste0("Memory.Storage: table.invalid: ", invalid.table, " is not a valid table.")
    # When
    input <- TRUE
    
    # Then
    input |> exception[['table.invalid']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When input |> exception[['entity.not.found']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['entity.not.found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Validation.Exceptions()
    
    expected.error <- 'Memory.Storage: entity.not.found: Entity not found in storage.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['entity.not.found']]() |> expect.error(expected.error)
  })
})
