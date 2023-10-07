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
  it("then services contains Create.Table service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Create.Table']] |> expect.exist()
  })
  it("then services contains Seed.Table service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Seed.Table']] |> expect.exist()
  })
  it("then services contains Execute.Query service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['Execute.Query']] |> expect.exist()
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

describe("When model |> service[['Create.Table']](table)",{
  it("then table is created in memory",{
    # Given
    broker  <- Memory.Storage.Broker()

    service <- broker |> Memory.Storage.Service()

    model <- Todo.Model()
    table <- 'Todo'

    expected.tables <- data.frame(name = table)

    # When
    model |> service[['Create.Table']](table)

    # Then
    broker[['Get.Tables']]() |> expect.equal(expected.tables)
  })
  it('then an exception is thrown if model is NULL',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- NULL

    expected.error <- "Argument.NULL: 'model' cannot not be NULL."

    # Then
    model |> service[['Create.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if model is not data.frame',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- list()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    model |> service[['Create.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if model is not empty data.frame',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- data.frame(Id =  '123')

    expected.error <- "Rows.Invalid: Got 1 rows but expected 0 rows."

    # Then
    model |> service[['Create.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- Todo.Model()
    table <- NULL

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    model |> service[['Create.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- Todo.Model()

    table <- 123

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    model |> service[['Create.Table']](table) |> expect.error(expected.error)
  })
})

describe("when data |> service[['Seed.Table']](table)",{
  it("then data are inserted into table in memory",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    table <- 'Todo'

    seed.data     <- Todo.Mock.Data
    expected.data <- seed.data

    # When
    seed.data |> service[['Seed.Table']](table)

    # Then
    actual.data <- table |> broker[['Select']]()
    actual.data |> expect.equal.data(expected.data)
  })
  it("then an exception is thrown if data is NULL",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- NULL

    expected.error <- "Argument.NULL: 'data' cannot not be NULL."

    # Then
    seed.data |> service[['Seed.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if data is not data.frame',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- list()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    seed.data |> service[['Seed.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if data is empty data.frame',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- data.frame()

    expected.error <- "Rows.Invalid: Got 0 rows but expected >0 rows."

    # Then
    seed.data |> service[['Seed.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- NULL
    seed.data  <- Todo.Mock.Data

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    seed.data |> service[['Seed.Table']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 123
    seed.data  <- Todo.Mock.Data

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    seed.data |> service[['Seed.Table']](table) |> expect.error(expected.error)
  })
})

describe("When query |> services[['Execute.Query']]()",{
  it("then an exception is thrown",{
    # Given
    services <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    query <- "SELECT 1"

    expected.error <- "Memory Storage Provider has no Execute.Query implementation."
    
    # Then
    query |> services[['Execute.Query']]() |> expect.error()
  })
})

describe("When entity |> service[['Add']](table)",{
  it("then entity is Add table in data store",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    table <- 'Todo'

    Todo.Mock.Data |> broker[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()
    
    expected.entity <- new.entity

    # When
    new.entity |> service[['Add']](table)

    # Then
    actual.entity <- new.entity[['Id']] |> broker[['SelectWhereId']](table, fields)
    actual.entity |> expect.equal.data(expected.entity)

    new.entity[['Id']] |> broker[['Delete']](table)
  })
  it('then an exception is thrown if entity is NULL',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # Then
    NULL |> service[['Add']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity is not data.frame',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    list() |> service[['Add']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity does not have one row',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # Then
    data.frame() |> service[['Add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not new",{
    # Given
    service  <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
       
    Todo.Mock.Data |> service[['Seed.Table']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)

    expected.error <- "Memory.Storage: Key.Violation: Duplicate Primary Key not allowed."

    # Then
    existing.entity |> service[['Add']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    new.entity |> service[['Add']](NULL) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    new.entity |> service[['Add']](123) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'

    Todo.Mock.Data |> service[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()
    
    invalid.table <- 'Invalid'

    expected.error <- "Memory.Storage: Table.Invalid: Invalid is not a valid table."

    # Then
    new.entity |> service[['Add']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When table |> service[['Retrieve']](fields)",{
  it("then all entities in table in data store is returned",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    expected.entities <- Todo.Mock.Data

    # When
    actual.entities <- table |> service[['Retrieve']](fields)

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    NULL |> service[['Retrieve']](fields) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    123 |> service[['Retrieve']](fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    invalid.table <- 'Table.Invalid'

    expected.error <- "Memory.Storage: Table.Invalid: Table.Invalid is not a valid table."

    # Then
    invalid.table |> service[['Retrieve']](fields) |> expect.error(expected.error)
  })
})

describe("When id |> service[['RetrieveWhereId']](table, fields)",{
  it("then entity with id in table in data store is returned",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)
    expected.entity <- existing.entity

    id <- existing.entity[['Id']]

    # When
    actual.entity <- id |> service[['RetrieveWhereId']](table, fields)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
  it('then an exception is thrown if id is NULL',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # Then
    NULL |> service[['RetrieveWhereId']](table, fields) |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    123 |> service[['RetrieveWhereId']](table, fields) |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is invalid identifier',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # Then
    'InvalidId' |> service[['RetrieveWhereId']](table, fields) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    existing.entity <- Todo.Mock.Data |> tail(1)
    id <- existing.entity[['Id']]

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    id |> service[['RetrieveWhereId']](NULL, fields) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    existing.entity <- Todo.Mock.Data |> tail(1)
    id <- existing.entity[['Id']]

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    id |> service[['RetrieveWhereId']](123, fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    existing.entity <- Todo.Mock.Data |> tail(1)
    id <- existing.entity[['Id']]

    invalid.table <- 'Table.Invalid'

    expected.error <- "Memory.Storage: Table.Invalid: Table.Invalid is not a valid table."

    # Then
    id |> service[['RetrieveWhereId']](invalid.table, fields) |> expect.error(expected.error)
  })
})

describe("When entity |> service[['Modify']](table)",{
  it('then entity is updated in table in data store',{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()

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
  it('then an exception is thrown if entity is NULL',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # Then
    NULL |> service[['Modify']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity is not data.frame',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    list() |> service[['Modify']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity does not have one row',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # Then
    data.frame() |> service[['Modify']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    new.entity |> service[['Modify']](NULL) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table in not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    new.entity |> service[['Modify']](123) |> expect.error(expected.error)
  })
  it('then an exception is thrown if entity does not exist',{
    # Given
    service <-
      Memory.Storage.Broker() |>
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()

    expected.error <- "Memory.Storage: Entity.Not.Found: Entity not found in storage."

    # Then
    new.entity |> service[['Modify']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is invalid',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    entity <- Todo.Mock.Data |> tail(1)
    id     <- entity[['Id']]

    updated.entity <- entity
    updated.entity[['Status']] <- 'Updated'

    expected.error <- "Memory.Storage: Table.Invalid: Table.Invalid is not a valid table."

    invalid.table <- 'Table.Invalid'

    # Then
    updated.entity |> service[['Modify']](invalid.table) |> expect.error(expected.error)
  })
})

describe("when id |> service[['Remove']](table)",{
  it('then entity with id in table in data store is deleted',{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()

    new.entity |> broker[['Insert']](table)
    id <- new.entity[['Id']]

    expected.rows <- 0

    # When
    id |> service[['Remove']](table)

    # Then
    id |> broker[['SelectWhereId']](table, fields) |> expect.rows(expected.rows)
  })
  it('then an exception is thrown if id is NULL',{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
    
    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # Then
    NULL |> service[['Remove']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is not characters',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    123 |> service[['Remove']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if id is invalid identifier',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
    
    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # Then
    'InvalidId' |> service[['Remove']](table) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is NULL',{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()

    new.entity |> broker[['Insert']](table)
    id <- new.entity[['Id']]
    
    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    id |> service[['Remove']](NULL) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is not characters',{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    new.entity <- 'Task' |> Todo()

    new.entity |> broker[['Insert']](table)
    id <- new.entity[['Id']]
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    id |> service[['Remove']](123) |> expect.error(expected.error)
  })
  it('then an exception is thrown if table is invalid',{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todo.Mock.Data |> service[['Seed.Table']](table)

    entity <- Todo.Mock.Data |> tail(1)
    id     <- entity[['Id']]

    invalid.table <- 'Table.Invalid'

    expected.error <- "Memory.Storage: Table.Invalid: Table.Invalid is not a valid table."

    # Then
    id |> service[['Remove']](invalid.table) |> expect.error(expected.error) 
  })
})  