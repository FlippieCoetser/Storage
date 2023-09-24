Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NoExecuteQuery']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: ExecuteQuery not implemented.', call. = FALSE)
    }
  }
  exceptions[['DuplicateId']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Duplicate Id not allowed.', call. = FALSE)
    }
  }
  return(exceptions)
}