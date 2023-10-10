describe('Todo.Model',{
  it('Exist',{
    Todo.Model |> expect.exist()
  })
})

describe("When model <- Todo.Model()",{
  it("then model is an empty data.frame",{
    # When
    model <- Todo.Model()

    # Then
    model |> expect.data.frame()
    model |> expect.empty()
  })
  it("then model has 'id' column of type character",{
    # When
    model <- Todo.Model()

    # Then
    model[['id']] |> expect.exist()
    model[['id']] |> expect.character()
  })
  it("then model has 'task' column of type character",{
    # When
    model <- Todo.Model()

    # Then
    model[['task']] |> expect.exist()
    model[['task']] |> expect.character()
  })
  it("then model has 'status' column of type character",{
    # When
    model <- Todo.Model()

    # Then
    model[['status']] |> expect.exist()
    model[['status']] |> expect.character()
  })
})