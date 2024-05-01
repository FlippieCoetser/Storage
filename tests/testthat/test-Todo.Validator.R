describe('Todo.Validator',{
  it('Exist',{
    Todo.Validator |> expect.exist()
  })
})

describe("When validations <- Todo.Validator()",{
  it("then validations is a list",{
    # Given
    validations <- Todo.Validator()

    # Then
    validations |> expect.list()
  })
  it("then validations contains 'Todo' validation",{
    # Given
    validations <- Todo.Validator()

    # Then
    validations[["Todo"]] |> expect.exist()
  })
  it("then validations contains 'Todo.Exist' validation",{
    # Given
    validations <- Todo.Validator()

    # Then
    validations[["Todo.Exist"]] |> expect.exist()
  })
  it("then validations contains 'Has.Id' validation",{
    # Given
    validations <- Todo.Validator()

    # Then
    validations[["Has.Id"]] |> expect.exist()
  })
  it("then validations contains 'Has.Task' validation",{
    # Given
    validations <- Todo.Validator()

    # Then
    validations[["Has.Task"]] |> expect.exist()
  })
  it("then validations contains 'Has.Status' validation",{
    # Given
    validations <- Todo.Validator()

    # Then
    validations[["Has.Status"]] |> expect.exist()
  })
})

describe("When todo |> validate[['Todo.Exist']]()",{
  it("then todo is returned if todo is not NULL",{
    # Given
    validations <- Todo.Validator()

    # When
    todo <- list()

    # Then
    todo |> validations[["Todo.Exist"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo is not NULL",{
    # Given
    validations <- Todo.Validator()

    # When
    todo <- list()

    # Then
    todo |> validations[['Todo.Exist']]() |> expect.no.error()
  })
  it("then an exception is thrown if todo is NULL",{
    # Given
    validations <- Todo.Validator()

    excepted.error <- "Successful validation requires a Todo"

    # When
    todo <- NULL

    # Then
    todo |> validations[["Todo.Exist"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['Has.Id']]()",{
  it("then todo is returned if todo has an id",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['id']] <- 1

    # Then
    todo |> validate[["Has.Id"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo has an id",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['id']] <- 1

    # Then
    todo |> validate[["Has.Id"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo has no id",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Todo has no id"

    # When
    todo <- list()

    # Then
    todo |> validate[["Has.Id"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['Has.Task']]()",{
  it("then todo is returned if todo has an task",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['task']] <- 'task'

    # Then
    todo |> validate[["Has.Task"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo has an task",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['task']] <- 'task'

    # Then
    todo |> validate[["Has.Task"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo has no task",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Todo has no task"

    # When
    todo <- list()

    # Then
    todo |> validate[["Has.Task"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['Has.Status']]()",{
  it("then todo is returned if todo has an status",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['status']] <- 'status'

    # Then
    todo |> validate[["Has.Status"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo has an status",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['status']] <- 'status'

    # Then
    todo |> validate[["Has.Status"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo has no status",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Todo has no status"

    # When
    todo <- list()

    # Then
    todo |> validate[["Has.Status"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['Todo']]()",{
  it("then todo is returned if todo is valid",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['id']] <- 1
    todo[['task']] <- 'task'
    todo[['status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo is valid",{
    # Given
    validate <- Todo.Validator()

    # When
    todo <- list()
    todo[['id']] <- 1
    todo[['task']] <- 'task'
    todo[['status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo is NULL",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Successful validation requires a Todo"

    # When
    todo <- NULL

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
  it("then an exception is thrown if todo has no id",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Todo has no id"

    # When
    todo <- list()
    todo[['task']] <- 'task'
    todo[['status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
  it("then an exception is thrown if todo has no task",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Todo has no task"

    # When
    todo <- list()
    todo[['id']] <- 1
    todo[['status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
  it("then an exception is thrown if todo has no status",{
    # Given
    validate <- Todo.Validator()

    excepted.error <- "Todo has no status"

    # When
    todo <- list()
    todo[['id']] <- 1
    todo[['task']] <- 'task'

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
})

describe("When id |> validate[['Id']]()",{
  it("then id is returned if id is not null",{
    # Given
    validate <- Todo.Validator()

    # When
    id <- uuid::UUIDgenerate()

    # Then
    id |> validate[["Id"]]() |> expect.equal(id)
  })
  it("then no exception is thrown when id is not null",{
    # Given
    validate <- Todo.Validator()

    # When
    id <- uuid::UUIDgenerate()

    # Then
    id |> validate[["Id"]]() |> expect.no.error()
  })
  it("then an exception is thrown when id is null",{
    # Given
    validate <- Todo.Validator()

    expected.error <- 'Id is null. Provide an id.'

    # When
    id <- NULL

    # Then
    id |> validate[["Id"]]() |> expect.error(expected.error)
  })
})