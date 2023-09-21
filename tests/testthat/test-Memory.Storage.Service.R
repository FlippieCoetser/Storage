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
  it("then services contains ExecuteQuery service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['ExecuteQuery']] |> expect.exist()
  })
  it("then services contains Insert service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Insert']] |> expect.exist()
  })
  it("then services contains Select service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Select']] |> expect.exist()
  })
  it("then services contains SelectWhereId service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['SelectWhereId']] |> expect.exist()
  })
  it("then services contains Update service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Update']] |> expect.exist()
  })
})