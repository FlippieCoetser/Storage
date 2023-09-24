describe('Todo.Mock.Data',{
  it('Exist',{
    Todo.Mock.Data |> expect.exist()
  })
})

describe("When data <- Todo.Mock.Data",{
  it("then data contains Id column",{
    # When
    data <- Todo.Mock.Data

    # Then
    data[['Id']] |> expect.exist()
  })
})