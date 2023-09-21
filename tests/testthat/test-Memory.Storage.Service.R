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

describe("When entity |> service[['Insert']](table)",{
  it("then entity is inserted table in data store",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker(data)
    service <- broker        |> Memory.Storage.Service()

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    
    expected.entity <- new.entity

    # When
    new.entity |> service[['Insert']](table)

    # Then
    actual.entity <- fields |> broker[['SelectWhereId']](table, new.entity[['Id']])
    actual.entity |> expect.equal.data(expected.entity)

    new.entity[['Id']] |> broker[['Delete']]('Todo')
  })
})

describe("When fields |> service[['Select']](table)",{
  it("then all entities in table in data store is returned",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker(data)
    service <- broker        |> Memory.Storage.Service()

    expected.entities <- data[[table]]

    # When
    actual.entities <- fields |> service[['Select']](table)

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
})

describe("When fields |> service[['SelectWhereId']](table, id)",{
  it("then entity with id in table in data store is returned",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker(data)
    service <- broker        |> Memory.Storage.Service()

    existing.entity <- data[[table]] |> tail(1)
    expected.entity <- existing.entity

    id <- existing.entity[['Id']]

    # When
    actual.entity <- fields |> service[['SelectWhereId']](table, id)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
})