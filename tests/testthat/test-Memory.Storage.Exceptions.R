describe('Memory.Storage.Exceptions',{
  it('Exist',{
    Memory.Storage.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Memory.Storage.Exceptions()",{
  it("then exceptions is a list",{
    # When
    exceptions <- Memory.Storage.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it('then exceptions contains NoExecute.Query exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['NoExecute.Query']] |> expect.exist()
  })
  it('then exceptions contains DuplicateId exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['DuplicateId']] |> expect.exist()
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

describe("When input |> exception[['NoExecute.Query']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['NoExecute.Query']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: Execute.Query not implemented.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['NoExecute.Query']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['DuplicateId']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['DuplicateId']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: Duplicate Id not allowed.'
    # When
    input <- TRUE
    
    # Then
    input |> exception[['DuplicateId']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['Table.Invalid']](table)", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Table.Invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
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
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['Entity.Not.Found']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: Entity not found.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['Entity.Not.Found']]() |> expect.error(expected.error)
  })
})
