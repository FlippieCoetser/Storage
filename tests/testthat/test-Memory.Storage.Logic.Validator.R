describe('Memory.Storage.Logic.Validator',{
  it('Exist',{
    Memory.Storage.Logic.Validator |> expect.exist()
  })
})

describe('When validators <- Memory.Storage.Logic.Validator()',{
  it('then validators is a list',{
    # When
    validators <- Memory.Storage.Logic.Validator()

    # Then
    validators |> expect.list()
  })
  it('then validators contains Is.Existing.Table validator',{
    # When
    validators <- Memory.Storage.Logic.Validator()

    # Then
    validators[['Is.Existing.Table']] |> expect.exist()
  })
  it('then validators contains Is.New.Entity validator',{
    # When
    validators <- Memory.Storage.Logic.Validator()

    # Then
    validators[['Is.New.Entity']] |> expect.exist()
  })
})

describe("When table |> validate[['Is.Existing.Table']]()",{
  it("then no exception is thrown if table exist",{
    # Given
    table <- 'Todo'
    
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()


    Todo.Mock.Data |> broker[['Seed.Table']](table)

    validator <- broker |> Memory.Storage.Logic.Validator()

    valid.table <- table
    
    # Then
    valid.table |> validator[['Is.Existing.Table']]() |> expect.no.error()
  })
  it("then an exception is thrown if table does not exist",{
    # Given
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()
    Todo.Mock.Data |> broker[['Seed.Table']](table)

    validator <- broker |> Memory.Storage.Logic.Validator()

    invalid.table <- 'Table.Invalid'
    
    expected.error <- 'Memory Storage Provider Error: Table.Invalid is not a valid table.'
    
    # Then
    invalid.table |> validator[['Is.Existing.Table']]() |> expect.error(expected.error)
  })
  it("then table is returned if table exist",{
    # Given
    table <- 'Todo'
    
    configuration <- data.frame()

    broker <- configuration |> Memory.Storage.Broker()

    Todo.Mock.Data |> broker[['Seed.Table']](table)

    validator <- broker |> Memory.Storage.Logic.Validator()

    valid.table    <- table
    expected.table <- valid.table
    
    # When
    actual.table <- valid.table |> validator[['Is.Existing.Table']]()

    # Then
    actual.table |> expect.equal(expected.table)
  })
})