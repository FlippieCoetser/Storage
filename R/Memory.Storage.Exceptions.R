Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NoExecute.Query']]  <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Execute.Query not implemented.', call. = FALSE)
    }
  }
  exceptions[['Key.Duplicate']]      <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Duplicate Id not allowed.', call. = FALSE)
    }
  }
  exceptions[['Entity.Not.Found']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Entity not found.', call. = FALSE)
    }
  }
  exceptions[['Table.Invalid']]    <- \(invoke, table) {
    if(invoke) {
      stop('Memory Storage Provider Error: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  return(exceptions)
}