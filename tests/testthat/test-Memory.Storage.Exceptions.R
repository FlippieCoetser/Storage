describe('Memory.Storage.Exceptions',{
  it('Exist',{
    Memory.Storage.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Memory.Storage.Exception()",{
  it("then exceptions is a list",{
    # When
    exceptions <- Memory.Storage.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it('then exceptions contains NoExecuteQuery exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['NoExecuteQuery']] |> expect.exist()
  })
  it('then exceptions contains DuplicateId exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['DuplicateId']] |> expect.exist()
  })
  it('then exceptions contains EntityNotFound exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['EntityNotFound']] |> expect.exist()
  })
  it('then exceptions contains InvalidTable exception',{
   # When
   exceptions <- Memory.Storage.Exceptions()
   
   # Then
   exceptions[['InvalidTable']] |> expect.exist()
  })
})

describe("When input |> exception[['NoExecuteQuery']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['NoExecuteQuery']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: ExecuteQuery not implemented.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['NoExecuteQuery']]() |> expect.error(expected.error)
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

describe("When input |> exception[['InvalidTable']](table)", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['InvalidTable']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Exceptions()

    invalid.table <- 'Invalid Table'
    
    expected.error <- paste0("Memory Storage Provider Error: ", invalid.table, " is not a valid table.")
    # When
    input <- TRUE
    
    # Then
    input |> exception[['InvalidTable']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When input |> exception[['EntityNotFound']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    # When
    input <- FALSE
    
    # Then
    input |> exception[['EntityNotFound']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE", {
    # Given
    exception <- Memory.Storage.Exceptions()
    
    expected.error <- 'Memory Storage Provider Error: Entity not found.'
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['EntityNotFound']]() |> expect.error(expected.error)
  })
})