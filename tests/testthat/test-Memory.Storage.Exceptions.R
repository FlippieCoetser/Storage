describe('Memory.Storage.Exceptions',{
  it('Exist',{
    Memory.Storage.Exceptions |> expect.exist()
  })
})

describe('When exceptions <- Memory.Storage.Exceptions()',{
  it('then exceptions is a list',{
    # When
    exceptions <- Memory.Storage.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it('then exceptions contains No.Execute.Query exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['No.Execute.Query']] |> expect.exist()
  })
  it('then exceptions contains Key.Violation exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['Key.Violation']] |> expect.exist()
  })
  it('then exceptions contains Entity.Not.Found exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['Entity.Not.Found']] |> expect.exist()
  })
  it('then exceptions contains Table.Invalid exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['Table.Invalid']] |> expect.exist()
  })
})

describe("When input |> exception[['No.Execute.Query']]()", {
  it('then no exception is thrown if input is FALSE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['No.Execute.Query']]() |> expect.no.error()
  })
  it('then an exception is thrown if input is TRUE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: Execute.Query not implemented.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['No.Execute.Query']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Key.Violation']]()", {
  it('then no exception is thrown if input is FALSE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Key.Violation']]() |> expect.no.error()
  })
  it('then an exception is thrown if input is TRUE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- "Memory.Storage: Key.Violation: Duplicate Primary Key not allowed."
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Key.Violation']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Table.Invalid']](table)", {
  it('then no exception is thrown if input is FALSE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Table.Invalid']]() |> expect.no.error()
  })
  it('then an exception is thrown if input is TRUE', {
    # Given
    exception <- Memory.Storage.Exceptions()

    invalid.table <- 'Invalid Table'
    
    expected.error <- paste0("Memory Storage Provider Error: ", invalid.table, " is not a valid table.")
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Table.Invalid']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Entity.Not.Found']]()", {
  it('then no exception is thrown if input is FALSE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Entity.Not.Found']]() |> expect.no.error()
  })
  it('then an exception is thrown if input is TRUE', {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: Entity not found.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Entity.Not.Found']]() |> expect.error(expected.error)
  })
})
