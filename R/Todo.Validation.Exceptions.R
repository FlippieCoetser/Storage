Todo.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Todo.NULL']]        <- \(invoke) {
    if (invoke) { stop('Successful validation requires a Todo', call. = FALSE)}
  }
  exceptions[['Todo.Id.NULL']]     <- \(invoke) {
    if (invoke) { stop('Todo has no id', call. = FALSE)}
  }
  exceptions[['Todo.Task.NULL']]   <- \(invoke) {
    if (invoke) { stop('Todo has no task', call. = FALSE)}
  }
  exceptions[['Todo.Status.NULL']] <- \(invoke) {
    if (invoke) { stop('Todo has no status', call. = FALSE)}
  }
  exceptions[['Id.NULL']]          <- \(invoke) {
    if (invoke) { stop('Id is null. Provide an id.', call. = FALSE)}
  }
  return(exceptions)
}