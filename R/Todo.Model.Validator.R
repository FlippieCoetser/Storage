Todo.Model.Validator <- \() {
  exception <- Todo.Model.Exceptions()

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
    todo[['Id']] |> is.null() |> exception[['Todo.Id.NULL']]()
    return(todo)
  }
  validations[['Has.Task']]   <- \(todo) {
    todo[['Task']] |> is.null() |> exception[['Todo.Task.NULL']]()
    return(todo)
  }
  validations[['Has.Status']] <- \(todo) {
    todo[['Status']] |> is.null() |> exception[['Todo.Status.NULL']]()
    return(todo)
  }
  validations[['Id']]         <- \(id) {
    id |> is.null() |> exception[['Id.NULL']]()
    return(id)
  }
  return(validations)
}