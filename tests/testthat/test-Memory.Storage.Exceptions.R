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
})