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
    data[['id']] |> expect.exist()
  })
  it("then data contains Task column",{
    # When
    data <- Todo.Mock.Data

    # Then
    data[['task']] |> expect.exist()
  })
  it("then data contains Status column",{
    # When
    data <- Todo.Mock.Data

    # Then
    data[['status']] |> expect.exist()
  })
})