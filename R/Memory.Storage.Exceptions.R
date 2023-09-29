Memory.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NoExecuteQuery']]    <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: ExecuteQuery not implemented.', call. = FALSE)
    }
  }
  exceptions[['DuplicateId']]       <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Duplicate Id not allowed.', call. = FALSE)
    }
  }
  exceptions[['EntityNotFound']]    <- \(invoke) {
    if(invoke) {
      stop('Memory Storage Provider Error: Entity not found.', call. = FALSE)
    }
  }
  exceptions[['InvalidTable']]      <- \(invoke, table) {
    if(invoke) {
      stop('Memory Storage Provider Error: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  exceptions[['InvalidType']]       <- \(invoke, type) {
    if(invoke) {
      stop("Memory Storage Provider Error: Invalid Type. Expected '", type,"'.", call. = FALSE)
    }
  }
  exceptions[['InvalidRows']]       <- \(invoke, count) {
    if(invoke) {
      stop('Memory Storage Provider Error: Invalid number of rows. Expected ', count, ' rows.', call. = FALSE)
    }
  }
  exceptions[['InvalidIdentifier']] <- \() { }
  exceptions[['IsNULL']]            <- \(invoke, variable) {
    if(invoke) {
      stop('Memory Storage Provider Error: ',variable,' is NULL.', call. = FALSE)
    }
  }
  return(exceptions)
}