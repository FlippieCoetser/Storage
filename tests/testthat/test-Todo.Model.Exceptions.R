describe('Todo.Model.Exceptions',{
  it('Exist',{
    Todo.Model.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Todo.Model.Exceptions()",{
  it("then exceptions is a list",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains 'Todo.NULL' exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["Todo.NULL"]] |> expect.exist()
  })
  it("then exceptions contains 'Todo.Id.NULL' exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["Todo.Id.NULL"]] |> expect.exist()
  })
  it("then exceptions contains 'Todo.Task.NULL' exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["Todo.Task.NULL"]] |> expect.exist()
  })
  it("then exceptions contains 'Todo.Status.NULL' exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["Todo.Status.NULL"]] |> expect.exist()
  })
  it("then exceptions contains 'IsIsNull' exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["Id.NULL"]] |> expect.exist()
  })
})

describe("When input |> exception[['Todo.NULL']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Todo.NULL"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- "Successful validation requires a Todo"

    # When
    input <- TRUE

    # Then
    input |> exception[["Todo.NULL"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['Todo.Id.NULL']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Todo.Id.NULL"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Todo has no id'

    # When
    input <- TRUE

    # Then
    input |> exception[["Todo.Id.NULL"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['Todo.Task.NULL']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Todo.Task.NULL"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Todo has no task'

    # When
    input <- TRUE

    # Then
    input |> exception[["Todo.Task.NULL"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['Todo.Status.NULL']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Todo.Status.NULL"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Todo has no status'

    # When
    input <- TRUE

    # Then
    input |> exception[["Todo.Status.NULL"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['Id.NULL']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Id.NULL"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Id is null. Provide an id.'

    # When
    input <- TRUE

    # Then
    input |> exception[["Id.NULL"]]() |> expect.error(excepted.error)
  })
})