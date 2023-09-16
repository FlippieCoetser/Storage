ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['dsnNotFound']] <- \() {}
  return(exceptions)
}