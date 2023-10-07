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
})