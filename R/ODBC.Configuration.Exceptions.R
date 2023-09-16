ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Configuration']] <- \(error) {
    'DSN' |> grepl(error) |> exceptions[['dsnNotFound']]()
    'UID' |> grepl(error) |> exceptions[['uidNotFound']]()
    'PWD' |> grepl(error) |> exceptions[['pwdNotFound']]()
  }
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
    if(invoke) {
      stop("No PWD environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  return(exceptions)
}