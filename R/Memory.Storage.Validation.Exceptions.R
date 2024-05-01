Memory.Storage.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['not.implemented']]  <- \(invoke) {
    if(invoke) {
      stop('Memory.Storage: not.implemented.', call. = FALSE)
    }
  }
  exceptions[['key.violation']]    <- \(invoke) {
    if(invoke) {
      stop('Memory.Storage: key.violation: Duplicate Primary Key not allowed.', call. = FALSE)
    }
  }
  exceptions[['entity.not.found']] <- \(invoke) {
    if(invoke) {
      stop('Memory.Storage: entity.not.found: Entity not found in storage.', call. = FALSE)
    }
  }
  exceptions[['table.invalid']]    <- \(invoke, table) {
    if(invoke) {
      stop('Memory.Storage: table.invalid: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  return(exceptions)
}