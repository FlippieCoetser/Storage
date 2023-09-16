ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['dsnNotFound']] <- \(invoke) {
    if(invoke) {
      stop("No DSN environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['uidNotFound']] <- \(invoke) {
    if(invoke) {
      stop("No UID environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['pwdNotFound']] <- \(invoke) {

  }
  return(exceptions)
}