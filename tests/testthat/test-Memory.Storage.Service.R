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
  it("then services contains CreateTable service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['CreateTable']] |> expect.exist()
  })
  it("then services contains SeedTable service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['SeedTable']] |> expect.exist()
  })
  it("then services contains ExecuteQuery service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['ExecuteQuery']] |> expect.exist()
  })
  it("then services contains Add service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Add']] |> expect.exist()
  })
  it("then services contains Retrieve service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Retrieve']] |> expect.exist()
  })
  it("then services contains RetrieveWhereId service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['RetrieveWhereId']] |> expect.exist()
  })
  it("then services contains Modify service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Modify']] |> expect.exist()
  })
  it("then services contains Remove service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Remove']] |> expect.exist()
  })
})

describe("When model |> service[['CreateTable']](table)",{
  it("then table is created in memory",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    model <- data.frame(
      Id     = character(0),
      Task   = character(0),
      Status = character(0)
    )

    table <- 'Todo'

    # When
    model |> service[['CreateTable']](table)

    # Then
    broker[['GetTableNames']]() |> expect.equal(table)
  })
  it('then an exception is thrown if model is NULL',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- NULL

    expected.error <- "Memory Storage Provider Error: model is NULL."

    # Then
    model |> service[['CreateTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if model is not data.frame',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- list()

    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'data.frame'."

    # Then
    model |> service[['CreateTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if model is not empty data.frame',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- data.frame(Id =  '123')

    expected.error <- "Memory Storage Provider Error: Invalid number of rows. Expected 0 rows."

    # Then
    model |> service[['CreateTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- data.frame(
      Id     = character(0),
      Task   = character(0),
      Status = character(0)
    )

    table <- NULL

    expected.error <- "Memory Storage Provider Error: table is NULL."

    # Then
    model |> service[['CreateTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- data.frame(
      Id     = character(0),
      Task   = character(0),
      Status = character(0)
    )

    table <- 123

    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'character'."

    # Then
    model |> service[['CreateTable']](table) |> expect.error(expected.error)
  })
})

describe("when data |> service[['SeedTable']](table)",{
  it("then data are inserted into table in memory",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    table <- 'Todo'

    seed.data     <- Todo.Mock.Data
    expected.data <- seed.data

    # When
    seed.data |> service[['SeedTable']](table)

    # Then
    actual.data <- table |> broker[['Select']]()
    actual.data |> expect.equal.data(expected.data)
  })
  it("then an exception is thrown if data is NULL",{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- NULL

    expected.error <- "Memory Storage Provider Error: data is NULL."

    # Then
    seed.data |> service[['SeedTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if data is not data.frame',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- list()

    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'data.frame'."

    # Then
    seed.data |> service[['SeedTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if data is empty data.frame',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- data.frame()

    expected.error <- "Memory Storage Provider Error: Invalid number of rows. Expected >0 rows."

    # Then
    seed.data |> service[['SeedTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- NULL
    seed.data  <- Todo.Mock.Data

    expected.error <- "Memory Storage Provider Error: table is NULL."

    # Then
    seed.data |> service[['SeedTable']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    configuration <- data.frame()

    service <- configuration |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 123
    seed.data  <- Todo.Mock.Data

    expected.error <- "Memory Storage Provider Error: Invalid Type. Expected 'character'."

    # Then
    seed.data |> service[['SeedTable']](table) |> expect.error(expected.error)
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

describe("When entity |> service[['Add']](table)",{
  it("then entity is Add table in data store",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    
    expected.entity <- new.entity

    # When
    new.entity |> service[['Add']](table)

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
       
    Todo.Mock.Data |> service[['SeedTable']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)

    expected.error <- "Memory Storage Provider Error: Duplicate Id not allowed."

    # Then
    existing.entity |> service[['Add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()

    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    
    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    new.entity |> service[['Add']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When table |> service[['Retrieve']](fields)",{
  it("then all entities in table in data store is returned",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    expected.entities <- Todo.Mock.Data

    # When
    actual.entities <- table |> service[['Retrieve']](fields)

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()
 
    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    invalid.table |> service[['Retrieve']](fields) |> expect.error(expected.error)
  })
})

describe("When id |> service[['RetrieveWhereId']](table, fields)",{
  it("then entity with id in table in data store is returned",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)
    expected.entity <- existing.entity

    id <- existing.entity[['Id']]

    # When
    actual.entity <- id |> service[['RetrieveWhereId']](table, fields)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()
 
    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)
    id <- existing.entity[['Id']]

    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    id |> service[['RetrieveWhereId']](invalid.table, fields) |> expect.error(expected.error)
  })
})

describe("When entity |> service[['Modify']](table)",{
  it("then entity is updated in table in data store",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

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
    updated.entity |> service[['Modify']](table)

    # Then
    actual.entity <- id |> broker[['SelectWhereId']](table, fields)
    actual.entity |> expect.equal.data(expected.entity)
  })
  it("then an exception is thrown if entity does not exist",{
    # Given
    configuration <- data.frame()

    service <- configuration  |> 
      Memory.Storage.Broker() |>
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    expected.error <- "Memory Storage Provider Error: Entity not found."

    # Then
    new.entity |> service[['Modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()

    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    entity <- Todo.Mock.Data |> tail(1)
    id     <- entity[['Id']]

    updated.entity <- entity
    updated.entity[['Status']] <- 'Updated'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    invalid.table <- 'InvalidTable'

    # Then
    updated.entity |> service[['Modify']](invalid.table) |> expect.error(expected.error)
  })
})

describe("when id |> service[['Remove']](table)",{
  it("then entity with id in table in data store is deleted",{
    # Given
    broker  <- configuration |> Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    new.entity <- data.frame(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )

    new.entity |> broker[['Insert']](table)
    id <- new.entity[['Id']]

    expected.rows <- 0

    # When
    id |> service[['Remove']](table)

    # Then
    id |> broker[['SelectWhereId']](table, fields) |> expect.rows(expected.rows)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    configuration <- data.frame()

    service <- configuration  |> 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['SeedTable']](table)

    entity <- Todo.Mock.Data |> tail(1)
    id     <- entity[['Id']]

    invalid.table <- 'InvalidTable'

    expected.error <- "Memory Storage Provider Error: InvalidTable is not a valid table."

    # Then
    id |> service[['Remove']](invalid.table) |> expect.error(expected.error) 
  })
})  