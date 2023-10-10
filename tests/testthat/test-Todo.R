describe('Todo',{
  it('Exist',{
    Todo |> expect.exist()
  })
})

describe("When todo <- task |> Todo()",{
  it("then todo is a data.frame",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo |> expect.data.frame()
  })
  it("then todo has 'id' column",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo[['id']] |> expect.exist()
  })
  it("then todo has 'task' columns with value task",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo[['task']] |> expect.exist()
    todo[['task']] |> expect.equal(task)
  })
  it("then todo has 'status' column with default value new",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo[['status']] |> expect.exist()
    todo[['status']] |> expect.equal('New')
  })
})