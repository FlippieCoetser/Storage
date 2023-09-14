describe("Todo.Model.Validator",{
  it("Exist",{
    Todo.Model.Validator |> expect.exist()
  })
})

describe("When validations <- Todo.Model.Validator()",{
  it("then validations is a list",{
    # Given
    validations <- Todo.Model.Validator()

    # Then
    validations |> expect.list()
  })
  it("then validations contains Todo validation",{
    # Given
    validations <- Todo.Model.Validator()

    # Then
    validations[["Todo"]] |> expect.exist()
  })
  it("then validations contains TodoExist validation",{
    # Given
    validations <- Todo.Model.Validator()

    # Then
    validations[["TodoExist"]] |> expect.exist()
  })
  it("then validations contains HasId validation",{
    # Given
    validations <- Todo.Model.Validator()

    # Then
    validations[["HasId"]] |> expect.exist()
  })
  it("then validations contains HasTask validation",{
    # Given
    validations <- Todo.Model.Validator()

    # Then
    validations[["HasTask"]] |> expect.exist()
  })
  it("then validations contains HasStatus validation",{
    # Given
    validations <- Todo.Model.Validator()

    # Then
    validations[["HasStatus"]] |> expect.exist()
  })
})

describe("When todo |> validate[['TodoExist']]()",{
  it("then todo is returned if todo is not NULL",{
    # Given
    validations <- Todo.Model.Validator()

    # When
    todo <- list()

    # Then
    todo |> validations[["TodoExist"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo is not NULL",{
    # Given
    validations <- Todo.Model.Validator()

    # When
    todo <- list()

    # Then
    todo |> validations[["TodoExist"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo is NULL",{
    # Given
    validations <- Todo.Model.Validator()

    excepted.error <- "Successful validation requires a Todo"

    # When
    todo <- NULL

    # Then
    todo |> validations[["TodoExist"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['HasId']]()",{
  it("then todo is returned if todo has an Id",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Id']] <- 1

    # Then
    todo |> validate[["HasId"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo has an Id",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Id']] <- 1

    # Then
    todo |> validate[["HasId"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo has no Id",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Todo has no Id"

    # When
    todo <- list()

    # Then
    todo |> validate[["HasId"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['HasTask']]()",{
  it("then todo is returned if todo has an Task",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Task']] <- 'task'

    # Then
    todo |> validate[["HasTask"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo has an Task",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Task']] <- 'task'

    # Then
    todo |> validate[["HasTask"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo has no Task",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Todo has no Task"

    # When
    todo <- list()

    # Then
    todo |> validate[["HasTask"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['HasStatus']]()",{
  it("then todo is returned if todo has an Status",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Status']] <- 'Status'

    # Then
    todo |> validate[["HasStatus"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo has an Status",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Status']] <- 'Status'

    # Then
    todo |> validate[["HasStatus"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo has no Status",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Todo has no Status"

    # When
    todo <- list()

    # Then
    todo |> validate[["HasStatus"]]() |> expect.error(excepted.error)
  })
})

describe("When todo |> validate[['Todo']]()",{
  it("then todo is returned if todo is valid",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Id']] <- 1
    todo[['Task']] <- 'task'
    todo[['Status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.equal(todo)
  })
  it("then no exception is thrown if todo is valid",{
    # Given
    validate <- Todo.Model.Validator()

    # When
    todo <- list()
    todo[['Id']] <- 1
    todo[['Task']] <- 'task'
    todo[['Status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.no.error()
  })
  it("then an exception is thrown if todo is NULL",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Successful validation requires a Todo"

    # When
    todo <- NULL

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
  it("then an exception is thrown if todo has no Id",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Todo has no Id"

    # When
    todo <- list()
    todo[['Task']] <- 'task'
    todo[['Status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
  it("then an exception is thrown if todo has no Task",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Todo has no Task"

    # When
    todo <- list()
    todo[['Id']] <- 1
    todo[['Status']] <- 'Status'

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
  it("then an exception is thrown if todo has no Status",{
    # Given
    validate <- Todo.Model.Validator()

    excepted.error <- "Todo has no Status"

    # When
    todo <- list()
    todo[['Id']] <- 1
    todo[['Task']] <- 'task'

    # Then
    todo |> validate[["Todo"]]() |> expect.error(excepted.error)
  })
})

describe('When id |> validate[["Id"]]()',{
  it('then id is returned if id is not null',{
    # Given
    validate <- Todo.Model.Validator()

    # When
    id <- uuid::UUIDgenerate()

    # Then
    id |> validate[["Id"]]() |> expect.equal(id)
  })
  it('then no exception is thrown when id is not null',{
    # Given
    validate <- Todo.Model.Validator()

    # When
    id <- uuid::UUIDgenerate()

    # Then
    id |> validate[["Id"]]() |> expect.no.error()
  })
  it('then an exception is thrown when id is null',{
    # Given
    validate <- Todo.Model.Validator()

    expected.error <- 'Id is null. Provide an Id.'

    # When
    id <- NULL

    # Then
    id |> validate[["Id"]]() |> expect.error(expected.error)
  })
})