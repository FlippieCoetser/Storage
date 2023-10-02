Todo.Model.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Todo.NULL']]        <- \(invoke) {
    if (invoke) { stop('Successful validation requires a Todo', call. = FALSE)}
  }
  exceptions[['Todo.Id.NULL']]     <- \(invoke) {
    if (invoke) { stop('Todo has no Id', call. = FALSE)}
  }
  exceptions[['Todo.Task.NULL']]   <- \(invoke) {
    if (invoke) { stop('Todo has no Task', call. = FALSE)}
  }
  exceptions[['Todo.Status.NULL']] <- \(invoke) {
    if (invoke) { stop('Todo has no Status', call. = FALSE)}
  }
  exceptions[['Id.NULL']]          <- \(invoke) {
    if (invoke) { stop('Id is null. Provide an Id.', call. = FALSE)}
  }
  return(exceptions)
}