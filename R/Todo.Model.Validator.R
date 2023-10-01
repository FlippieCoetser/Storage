Todo.Model.Validator <- \() {
  exception <- Todo.Model.Exceptions()

  validations <- list()
  validations[['Todo']]      <- \(todo) { 
    todo |>
      validations[['TodoExist']]() |>
      validations[['HasId']]()     |>
      validations[['HasTask']]()   |>
      validations[['HasStatus']]()
    return(todo) 
  }
  # TODO: Refactor -> Todo.Exist
  validations[['TodoExist']] <- \(todo) {
    todo |> is.null() |> exception[['TodoIsNull']]()
    return(todo)
  }
  # TODO: Refactor -> Has.Id
  validations[['HasId']]     <- \(todo) {
    todo[['Id']] |> is.null() |> exception[['TodoIdIsNull']]()
    return(todo)
  }
  # TODO: Refactor -> Has.Task
  validations[['HasTask']]   <- \(todo) {
    todo[['Task']] |> is.null() |> exception[['TodoTaskIsNull']]()
    return(todo)
  }
  # TODO: Refactor -> Has.Status
  validations[['HasStatus']] <- \(todo) {
    todo[['Status']] |> is.null() |> exception[['TodoStatusIsNull']]()
    return(todo)
  }
  validations[['Id']]        <- \(id) {
    id |> is.null() |> exception[['IdIsNull']]()
    return(id)
  }
  return(validations)
}