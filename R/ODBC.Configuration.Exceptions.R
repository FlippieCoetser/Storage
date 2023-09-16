ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['dsnNotFound']] <- \(invoke) {
    if(invoke) {
      stop("No DSN environment variable not found in .Renviron Configuration file.")
    }
  }
  exceptions[['uidNotFound']] <- \() {}
  return(exceptions)
}