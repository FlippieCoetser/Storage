describe('Todo.Fields',{
  it('Exist',{
    Todo.Fields |> expect.exist()
  })
})

describe("When model <- Todo.Fields()",{
  it("then model is an empty data.frame",{
    # When
    model <- Todo.Fields()

    # Then
    model |> expect.data.frame()
    model |> expect.empty()
  })
  it("then model has 'id' column of type character",{
    # When
    model <- Todo.Fields()

    # Then
    model[['id']] |> expect.exist()
    model[['id']] |> expect.character()
  })
  it("then model has 'task' column of type character",{
    # When
    model <- Todo.Fields()

    # Then
    model[['task']] |> expect.exist()
    model[['task']] |> expect.character()
  })
  it("then model has 'status' column of type character",{
    # When
    model <- Todo.Fields()

    # Then
    model[['status']] |> expect.exist()
    model[['status']] |> expect.character()
  })
})