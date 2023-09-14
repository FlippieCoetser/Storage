Todo.Model.Exceptions <- \() {
  exceptions <- list()
  exceptions[['TodoIsNull']]       <- \(invoke) {
    if (invoke) { stop('Successful validation requires a Todo', call. = FALSE)}
  }
  exceptions[['TodoIdIsNull']]     <- \(invoke) {
    if (invoke) { stop('Todo has no Id', call. = FALSE)}
  }
  exceptions[['TodoTaskIsNull']]   <- \(invoke) {
    if (invoke) { stop('Todo has no Task', call. = FALSE)}
  }
  exceptions[['TodoStatusIsNull']] <- \(invoke) {
    if (invoke) { stop('Todo has no Status', call. = FALSE)}
  }
  exceptions[['IdIsNull']]         <- \(invoke) {
    if (invoke) { stop('Id is null. Provide an Id.', call. = FALSE)}
  }
  return(exceptions)
}