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
  it("then services contains create.table service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['create.table']] |> expect.exist()
  })
  it("then services contains seed.table service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['seed.table']] |> expect.exist()
  })
  it("then services contains execute.query service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['execute.query']] |> expect.exist()
  })
  it("then services contains add service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['add']] |> expect.exist()
  })
  it("then services contains retrieve service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['retrieve']] |> expect.exist()
  })
  it("then services contains retrieve.where.id service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['retrieve.where.id']] |> expect.exist()
  })
  it("then services contains modify service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['modify']] |> expect.exist()
  })
  it("then services contains remove service",{
    # When
    services <- Memory.Storage.Service()

    # Then
    services[['remove']] |> expect.exist()
  })
})

describe("When model |> service[['create.table']](table)",{
  it("then table is created in memory",{
    # Given
    broker  <- Memory.Storage.Broker()

    service <- broker |> Memory.Storage.Service()

    model <- Todo.Fields()
    table <- 'Todo'

    expected.tables <- data.frame(name = table)

    # When
    model |> service[['create.table']](table)

    # Then
    broker[['get.tables']]() |> expect.equal(expected.tables)
  })
  it("then an exception is thrown if model is NULL",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- NULL

    expected.error <- "Argument.NULL: 'model' cannot not be NULL."

    # Then
    model |> service[['create.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if model is not data.frame",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- list()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    model |> service[['create.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if model is not empty data.frame",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- data.frame(Id =  '123')

    expected.error <- "Rows.Invalid: Got 1 rows but expected 0 rows."

    # Then
    model |> service[['create.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- Todo.Fields()
    table <- NULL

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    model |> service[['create.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    model <- Todo.Fields()

    table <- 123

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    model |> service[['create.table']](table) |> expect.error(expected.error)
  })
})

describe("when data |> service[['seed.table']](table)",{
  it("then data are inserted into table in memory",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    table <- 'Todo'

    seed.data     <- Todos
    expected.data <- seed.data

    # When
    seed.data |> service[['seed.table']](table)

    # Then
    actual.data <- table |> broker[['select']]()
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
    seed.data |> service[['seed.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if data is not data.frame",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- list()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    seed.data |> service[['seed.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if data is empty data.frame",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'
    seed.data  <- data.frame()

    expected.error <- "Rows.Invalid: Got 0 rows but expected >0 rows."

    # Then
    seed.data |> service[['seed.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- NULL
    seed.data  <- Todos

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    seed.data |> service[['seed.table']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 123
    seed.data  <- Todos

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    seed.data |> service[['seed.table']](table) |> expect.error(expected.error)
  })
})

describe("When query |> services[['execute.query']]()",{
  it("then an exception is thrown",{
    # Given
    services <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    query <- "SELECT 1"

    expected.error <- "Memory Storage Provider has no execute.query implementation."
    
    # Then
    query |> services[['execute.query']]() |> expect.error()
  })
})

describe("When entity |> service[['add']](table)",{
  it("then entity is add table in data store",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    table <- 'Todo'

    Todos |> broker[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()
    
    expected.entity <- new.entity

    # When
    new.entity |> service[['add']](table)

    # Then
    actual.entity <- new.entity[['id']] |> broker[['select.where.Id']](table, fields)
    actual.entity |> expect.equal.data(expected.entity)

    new.entity[['id']] |> broker[['delete']](table)
  })
  it("then an exception is thrown if entity is NULL",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # Then
    NULL |> service[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not data.frame",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    list() |> service[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity does not have one row",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # Then
    data.frame() |> service[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not new",{
    # Given
    service  <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
       
    Todos |> service[['seed.table']](table)

    existing.entity <- Todos |> tail(1)

    expected.error <- "Memory.Storage: key.violation: Duplicate Primary Key not allowed."

    # Then
    existing.entity |> service[['add']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo.Model()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    new.entity |> service[['add']](NULL) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo.Model()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    new.entity |> service[['add']](123) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    table <- 'Todo'

    Todos |> service[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()
    
    invalid.table <- 'Invalid'

    expected.error <- "Memory.Storage: table.invalid: Invalid is not a valid table."

    # Then
    new.entity |> service[['add']](invalid.table) |> expect.error(expected.error)
  })
})

describe("When table |> service[['retrieve']](fields)",{
  it("then all entities in table in data store is returned",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    expected.entities <- Todos

    # When
    actual.entities <- table |> service[['retrieve']](fields)

    # Then
    actual.entities |> expect.equal.data(expected.entities)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    NULL |> service[['retrieve']](fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    123 |> service[['retrieve']](fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    invalid.table <- 'table.invalid'

    expected.error <- "Memory.Storage: table.invalid: table.invalid is not a valid table."

    # Then
    invalid.table |> service[['retrieve']](fields) |> expect.error(expected.error)
  })
})

describe("When id |> service[['retrieve.where.id']](table, fields)",{
  it("then entity with id in table in data store is returned",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker        |> Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    existing.entity <- Todos |> tail(1)
    expected.entity <- existing.entity

    id <- existing.entity[['id']]

    # When
    actual.entity <- id |> service[['retrieve.where.id']](table, fields)

    # Then
    actual.entity |> expect.equal.data(expected.entity)
  })
  it("then an exception is thrown if id is NULL",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # Then
    NULL |> service[['retrieve.where.id']](table, fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    123 |> service[['retrieve.where.id']](table, fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is invalid identifier",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # Then
    'InvalidId' |> service[['retrieve.where.id']](table, fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    existing.entity <- Todos |> tail(1)
    id <- existing.entity[['id']]

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    id |> service[['retrieve.where.id']](NULL, fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    existing.entity <- Todos |> tail(1)
    id <- existing.entity[['id']]

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    id |> service[['retrieve.where.id']](123, fields) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <-  
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    existing.entity <- Todos |> tail(1)
    id <- existing.entity[['id']]

    invalid.table <- 'table.invalid'

    expected.error <- "Memory.Storage: table.invalid: table.invalid is not a valid table."

    # Then
    id |> service[['retrieve.where.id']](invalid.table, fields) |> expect.error(expected.error)
  })
})

describe("When entity |> service[['modify']](table)",{
  it("then entity is updated in table in data store",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()

    new.entity |> broker[['insert']](table)
    id <- new.entity[['id']]

    updated.entity <- new.entity
    updated.entity[['status']] <- 'Updated'

    expected.entity <- updated.entity

    # When
    updated.entity |> service[['modify']](table)

    # Then
    actual.entity <- id |> broker[['select.where.Id']](table, fields)
    actual.entity |> expect.equal.data(expected.entity)
  })
  it("then an exception is thrown if entity is NULL",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Argument.NULL: 'entity' cannot not be NULL."

    # Then
    NULL |> service[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity is not data.frame",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Type.Mismatch: Got 'list' but expected 'data.frame'."

    # Then
    list() |> service[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity does not have one row",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    expected.error <- "Rows.Invalid: Got 0 rows but expected 1 rows."

    # Then
    data.frame() |> service[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo.Model()

    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    new.entity |> service[['modify']](NULL) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table in not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    new.entity <- 'Task' |> Todo.Model()

    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    new.entity |> service[['modify']](123) |> expect.error(expected.error)
  })
  it("then an exception is thrown if entity does not exist",{
    # Given
    service <-
      Memory.Storage.Broker() |>
      Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()

    expected.error <- "Memory.Storage: entity.not.found: Entity not found in storage."

    # Then
    new.entity |> service[['modify']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    entity <- Todos |> tail(1)
    id     <- entity[['id']]

    updated.entity <- entity
    updated.entity[['status']] <- 'Updated'

    expected.error <- "Memory.Storage: table.invalid: table.invalid is not a valid table."

    invalid.table <- 'table.invalid'

    # Then
    updated.entity |> service[['modify']](invalid.table) |> expect.error(expected.error)
  })
})

describe("when id |> service[['remove']](table)",{
  it("then entity with id in table in data store is deleted",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()

    new.entity |> broker[['insert']](table)
    id <- new.entity[['id']]

    expected.rows <- 0

    # When
    id |> service[['remove']](table)

    # Then
    id |> broker[['select.where.Id']](table, fields) |> expect.rows(expected.rows)
  })
  it("then an exception is thrown if id is NULL",{
    # Given
    service <-
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
    
    expected.error <- "Argument.NULL: 'id' cannot not be NULL."

    # Then
    NULL |> service[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is not characters",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    123 |> service[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if id is invalid identifier",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()
    
    expected.error <- "Identifier.Invalid: 'id' is not a valid UUID."

    # Then
    'InvalidId' |> service[['remove']](table) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is NULL",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()

    new.entity |> broker[['insert']](table)
    id <- new.entity[['id']]
    
    expected.error <- "Argument.NULL: 'table' cannot not be NULL."

    # Then
    id |> service[['remove']](NULL) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is not characters",{
    # Given
    broker  <- Memory.Storage.Broker()
    service <- broker |> Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    new.entity <- 'Task' |> Todo.Model()

    new.entity |> broker[['insert']](table)
    id <- new.entity[['id']]
    
    expected.error <- "Type.Mismatch: Got 'numeric' but expected 'character'."

    # Then
    id |> service[['remove']](123) |> expect.error(expected.error)
  })
  it("then an exception is thrown if table is invalid",{
    # Given
    service <- 
      Memory.Storage.Broker() |> 
      Memory.Storage.Service()

    Todos |> service[['seed.table']](table)

    entity <- Todos |> tail(1)
    id     <- entity[['id']]

    invalid.table <- 'table.invalid'

    expected.error <- "Memory.Storage: table.invalid: table.invalid is not a valid table."

    # Then
    id |> service[['remove']](invalid.table) |> expect.error(expected.error) 
  })
})  