ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['dsnIsNull']] <- \() {}
  return(exceptions)
}