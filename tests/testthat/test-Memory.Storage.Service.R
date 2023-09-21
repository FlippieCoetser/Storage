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
  it("then services contains Delete service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Delete']] |> expect.exist()
  })
})

describe("When query |> services[['ExecuteQuery']]()",{
  it("then an exception is thrown",{
    # Given
    configuration <- data.frame()

    services <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    query <- "SELECT 1"

    expected.error <- "Memory Storage Provider has no ExecuteQuery implementation."
    
    # Then
    query |> services[['ExecuteQuery']]() |> expect.error()
  })
})