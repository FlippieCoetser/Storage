Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Not.Implemented']]  <- \(invoke) {
    if(invoke) {
      stop('Memory.Storage: Not.Implemented.', call. = FALSE)
    }
  }
  exceptions[['Key.Violation']]    <- \(invoke) {
    if(invoke) {
      stop('Memory.Storage: Key.Violation: Duplicate Primary Key not allowed.', call. = FALSE)
    }
  }
  exceptions[['Entity.Not.Found']] <- \(invoke) {
    if(invoke) {
      stop('Memory.Storage: Entity.Not.Found: Entity not found in storage.', call. = FALSE)
    }
  }
  exceptions[['Table.Invalid']]    <- \(invoke, table) {
    if(invoke) {
      stop('Memory.Storage: Table.Invalid: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  return(exceptions)
}