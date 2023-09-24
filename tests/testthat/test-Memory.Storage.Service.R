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
  it("then services contains Seed service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Seed']] |> expect.exist()
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

describe("when entities |> service[['Seed']](table)",{
  it("then entities are inserted into table in memory",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    table <- 'Todo'

    seed.entities     <- Todo.Mock.Data
    expected.entities <- seed.entities

    # When
    seed.entities |> service[['Seed']](table)

    # Then
    actual.entities <- table |> broker[['Select']]()
    actual.entities |> expect.equal.data(expected.entities)
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
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    
    expected.entity <- new.entity

    # When
    new.entity |> service[['Insert']](table)

    # Then
    actual.entity <- new.entity[['Id']] |> broker[['SelectWhereId']](table, fields)
    actual.entity |> expect.equal.data(expected.entity)

    new.entity[['Id']] |> broker[['Delete']]('Todo')
  })
  it("then an exception is thrown if entity is not new",{
    # Given
    configuration <- data.frame()

    service  <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
       
    Todo.Mock.Data |> service[['Seed']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)

    expected.error <- "Memory Storage Provider Error: Duplicate Id not allowed."

    # Then
    existing.entity |> service[['Insert']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()

    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    
    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    new.entity |> service[['Insert']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When table |> service[['Select']](fields)",{
  it("then all entities in table in data store is returned",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    expected.entities <- Todo.Mock.Data

    # When
    actual.entities <- table |> service[['Select']](fields)

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()
 
    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    invalid.table |> service[['Select']](fields) |> expect.error(expected.error)
  })
})

describe("When id |> service[['SelectWhereId']](table, fields)",{
  it("then entity with id in table in data store is returned",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)
    expected.entity <- existing.entity

    id <- existing.entity[['Id']]

    # When
    actual.entity <- id |> service[['SelectWhereId']](table, fields)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()
 
    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)
    id <- existing.entity[['Id']]

    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    id |> service[['SelectWhereId']](invalid.table, fields) |> expect.error(expected.error)
  })
})

describe("When entity |> service[['Update']](table)",{
  it("then entity is updated in table in data store",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.entity |> broker[['Insert']](table)
    id <- new.entity[['Id']]

    updated.entity <- new.entity
    updated.entity[['Status']] <- 'Updated'

    expected.entity <- updated.entity

    # When
    updated.entity |> service[['Update']](table)

    # Then
    actual.entity <- id |> broker[['SelectWhereId']](table, fields)
    actual.entity |> expect.equal.data(expected.entity)
  })
})

describe("when id |> service[['Delete']](table)",{
  it("then entity with id in table in data store is deleted",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.entity |> broker[['Insert']](table)
    id <- new.entity[['Id']]

    expected.rows <- 0

    # When
    id |> service[['Delete']](table)

    # Then
    id |> broker[['SelectWhereId']](table, fields) |> expect.rows(expected.rows)
  })
})