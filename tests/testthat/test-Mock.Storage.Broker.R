describe("Mock.Storage.Broker",{
  it("Exist",{
    Mock.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- configuration |> Mock.Storage.Broker()",{
  it("then operations is a list",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains CreateConnection operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['CreateConnection']] |> expect.exist()
  })
  it("then operations contains ExecuteQuery operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['ExecuteQuery']] |> expect.exist()
  })
  it("then operations contains Insert operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['Insert']] |> expect.exist()
  })
  it("then operations contains Select operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['Select']] |> expect.exist()
  })
  it("then operations contains SelectWhereId operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['SelectWhereId']] |> expect.exist()
  })
  it("then operations contains Update operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['Update']] |> expect.exist()
  })
  it("then operations contains Delete operation",{
    # When
    operations <- Mock.Storage.Broker()

    # Then
    operations[['Delete']] |> expect.exist()
  })
})

describe("when operation[['CreateConnection']]()",{
  it("then an exceptions is thrown",{
    # When
    operation <- Mock.Storage.Broker()

    expected.error <- "Mock.Storage: CreateConnection operation not implemented"

    # Then
    operation[['CreateConnection']]() |> expect.error(expected.error)
  })
})

describe("when operation[['ExecuteQuery']]()",{
  it("then an exceptions is thrown",{
    # When
    operation <- Mock.Storage.Broker()

    expected.error <- "Mock.Storage: ExecuteQuery operation not implemented"

    # Then
    operation[['ExecuteQuery']]() |> expect.error(expected.error)
  })
})

describe("when todo |> operation[['Insert']]('Todo')",{
  it("then todo is inserted into mock data",{
    # Given
    operation <- configuration |> Mock.Storage.Broker(data)

    new.todo <- list(
      Id     = uuid::UUIDgenerate(),
      Task   = 'Task',
      Status = 'New'
    )
    id <- new.todo[['Id']]

    expected.todo <- new.todo |> as.data.frame()

    # When
    new.todo |> operation[['Insert']]('Todo')

    # Then
    actual.todo <- fields |> operation[['SelectWhereId']]('Todo', id)
    actual.todo |> expect.equal.data(expected.todo)

    id |> operation[['Delete']]('Todo')
  })
})
