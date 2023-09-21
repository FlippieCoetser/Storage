Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NoExecuteQuery']] <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider has no ExecuteQuery implementation.', call. = FALSE)
    }
  }
  return(exceptions)
}