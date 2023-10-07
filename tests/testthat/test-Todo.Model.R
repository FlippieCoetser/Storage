describe('Todo.Model',{
  it('Exist',{
    Todo.Model |> expect.exist()
  })
})

describe("When model <- task |> Todo.Model()",{
  it("then model is a data.frame",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo.Model()

    # Then
    model |> expect.data.frame()
  })
  it("then model has 'Id' column",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo.Model()

    # Then
    model[['Id']] |> expect.exist()
  })
  it("then model has 'Task' columns with value task",{
    # Given 
    task <- 'Task'

    # When
    model <- task |> Todo.Model()

    # Then
    model[['Task']] |> expect.exist()
    model[['Task']] |> expect.equal(task)
  })
})