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
  it("then todo has 'Id' column",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo[['Id']] |> expect.exist()
  })
  it("then todo has 'Task' columns with value task",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo[['Task']] |> expect.exist()
    todo[['Task']] |> expect.equal(task)
  })
  it("then todo has 'Status' column with default value new",{
    # Given 
    task <- 'Task'

    # When
    todo <- task |> Todo()

    # Then
    todo[['Status']] |> expect.exist()
    todo[['Status']] |> expect.equal('New')
  })
})