describe('Todo.Model',{
  it('Exist',{
    Todo.Model |> expect.exist()
  })
})

describe("When todo <- task |> Todo.Model()",{
  it("then todo is a data.frame",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo.Model()

    # Then
    todo |> expect.data.frame()
  })
  it("then todo has 'id' column",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo.Model()

    # Then
    todo[['id']] |> expect.exist()
  })
  it("then todo has 'task' columns with value task",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo.Model()

    # Then
    todo[['task']] |> expect.exist()
    todo[['task']] |> expect.equal(task)
  })
  it("then todo has 'status' column with default value new",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo.Model()

    # Then
    todo[['status']] |> expect.exist()
    todo[['status']] |> expect.equal('New')
  })
})