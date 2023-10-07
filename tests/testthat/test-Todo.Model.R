describe('Todo.Model',{
  it('Exist',{
    Todo.Model |> expect.exist()
  })
})

describe("When model <- Todo.Model()",{
  it("then model is a data.frame",{
    # When
    model <- Todo.Model()

    # Then
    model |> expect.data.frame()
  })
  it("then model has Id column of type character",{
    # When
    model <- Todo.Model()

    # Then
    model[['Id']] |> expect.exist()
    model[['Id']] |> expect.character()
  })
})