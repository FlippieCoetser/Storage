describe("Todo.Model.Exceptions",{
  it("Exist",{
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
  it("then exceptions contains TodoIsNull exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["TodoIsNull"]] |> expect.exist()
  })
  it("then exceptions contains TodoIdIsNull exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["TodoIdIsNull"]] |> expect.exist()
  })
  it("then exceptions contains TodoTaskIsNull exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["TodoTaskIsNull"]] |> expect.exist()
  })
  it("then exceptions contains TodoStatusIsNull exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["TodoStatusIsNull"]] |> expect.exist()
  })
  it("then exceptions contains IsIsNull exception",{
    # Given
    exceptions <- Todo.Model.Exceptions()

    # Then
    exceptions[["IdIsNull"]] |> expect.exist()
  })
})

describe("When input |> exception[['TodoIsNull']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["TodoIsNull"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- "Successful validation requires a Todo"

    # When
    input <- TRUE

    # Then
    input |> exception[["TodoIsNull"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['TodoIdIsNull']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["TodoIdIsNull"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Todo has no Id'

    # When
    input <- TRUE

    # Then
    input |> exception[["TodoIdIsNull"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['TodoTaskIsNull']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["TodoTaskIsNull"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Todo has no Task'

    # When
    input <- TRUE

    # Then
    input |> exception[["TodoTaskIsNull"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['TodoStatusIsNull']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["TodoStatusIsNull"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Todo has no Status'

    # When
    input <- TRUE

    # Then
    input |> exception[["TodoStatusIsNull"]]() |> expect.error(excepted.error)
  })
})

describe("When input |> exception[['IdIsNull']]()",{
  it("then no exceptions is thrown if input if FALSE",{
    # Given
    exception <- Todo.Model.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["IdIsNull"]]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # Given
    exception <- Todo.Model.Exceptions()

    excepted.error <- 'Id is null. Provide an Id.'

    # When
    input <- TRUE

    # Then
    input |> exception[["IdIsNull"]]() |> expect.error(excepted.error)
  })
})