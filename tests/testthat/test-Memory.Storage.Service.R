describe('Memory.Storage.Service',{
  it('Exist',{
    Memory.Storage.Service |> expect.exist()
  })
})

describe("When services <- Memory.Storage.Service()",{
  it("then services is a list",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services |> expect.list()
  })
})