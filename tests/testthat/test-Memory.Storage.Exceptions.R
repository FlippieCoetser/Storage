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
    
    expected.error <- "Memory Storage Provider has no ExecuteQuery implementation."
    
    # When
    input <- TRUE
    
    # Then
    input |> exception[['NoExecuteQuery']]() |> expect.error(expected.error)
  })
})