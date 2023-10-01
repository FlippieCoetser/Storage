Todo.Model.Exceptions <- \() {
  exceptions <- list()
  # TODO: Refactor -> Todo.NULL
  exceptions[['TodoIsNull']]       <- \(invoke) {
    if (invoke) { stop('Successful validation requires a Todo', call. = FALSE)}
  }
  # TODO: Refactor -> Todo.Id.NULL
  exceptions[['TodoIdIsNull']]     <- \(invoke) {
    if (invoke) { stop('Todo has no Id', call. = FALSE)}
  }
  # TODO: Refactor -> Todo.Task.NULL
  exceptions[['TodoTaskIsNull']]   <- \(invoke) {
    if (invoke) { stop('Todo has no Task', call. = FALSE)}
  }
  # TODO: Refactor -> Todo.Status.NULL
  exceptions[['TodoStatusIsNull']] <- \(invoke) {
    if (invoke) { stop('Todo has no Status', call. = FALSE)}
  }
  # TODO: Refactor -> Id.NULL
  exceptions[['IdIsNull']]         <- \(invoke) {
    if (invoke) { stop('Id is null. Provide an Id.', call. = FALSE)}
  }
  return(exceptions)
}