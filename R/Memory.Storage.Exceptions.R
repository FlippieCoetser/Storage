Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NoExecuteQuery']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: ExecuteQuery not implemented.', call. = FALSE)
    }
  }
  exceptions[['DuplicateId']]    <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Duplicate Id not allowed.', call. = FALSE)
    }
  }
  exceptions[['EntityNotFound']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Entity not found.', call. = FALSE)
    }
  }
  exceptions[['InvalidTable']]   <- \(invoke, table) {
    if(invoke) {
      stop('Memory Storage Provider Error: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  return(exceptions)
}