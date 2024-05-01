Todo.Validator <- \() {
  exception <- Todo.Validation.Exceptions()

  validations <- list()
  validations[['Todo']]       <- \(todo) { 
    todo |>
      validations[['Todo.Exist']]() |>
      validations[['Has.Id']]()     |>
      validations[['Has.Task']]()   |>
      validations[['Has.Status']]()
    return(todo) 
  }
  validations[['Todo.Exist']] <- \(todo) {
    todo |> is.null() |> exception[['Todo.NULL']]()
    return(todo)
  }
  validations[['Has.Id']]     <- \(todo) {
    todo[['id']] |> is.null() |> exception[['Todo.Id.NULL']]()
    return(todo)
  }
  validations[['Has.Task']]   <- \(todo) {
    todo[['task']] |> is.null() |> exception[['Todo.Task.NULL']]()
    return(todo)
  }
  validations[['Has.Status']] <- \(todo) {
    todo[['status']] |> is.null() |> exception[['Todo.Status.NULL']]()
    return(todo)
  }
  validations[['Id']]         <- \(id) {
    id |> is.null() |> exception[['Id.NULL']]()
    return(id)
  }
  return(validations)
}