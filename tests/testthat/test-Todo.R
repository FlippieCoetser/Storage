describe('Todo',{
  it('Exist',{
    Todo |> expect.exist()
  })
})

describe("When model <- task |> Todo()",{
  it("then model is a data.frame",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo()

    # Then
    model |> expect.data.frame()
  })
  it("then model has 'Id' column",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo()

    # Then
    model[['Id']] |> expect.exist()
  })
  it("then model has 'Task' columns with value task",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo()

    # Then
    model[['Task']] |> expect.exist()
    model[['Task']] |> expect.equal(task)
  })
  it("then model has 'Status' column with default value new",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo()

    # Then
    model[['Status']] |> expect.exist()
    model[['Status']] |> expect.equal('New')
  })
})