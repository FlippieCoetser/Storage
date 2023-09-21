Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NoExecuteQuery']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider has no ExecuteQuery implementation.', call. = FALSE)
    }
  }
  exceptions[['DuplicateId']] <- \(invoke) {
    if(invoke) {
      stop('Memory Data Store Error: Duplicate Id not allowed', call. = FALSE)
    }
  }
  return(exceptions)
}