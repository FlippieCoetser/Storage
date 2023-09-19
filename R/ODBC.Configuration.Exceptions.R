ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Configuration']]    <- \(error) {
    'DSN'      |> grepl(error) |> exceptions[['dsnNotFound']]()
    'DRIVER'   |> grepl(error) |> exceptions[['driverNotFound']]()
    'SERVER'   |> grepl(error) |> exceptions[['serverNotFound']]()
    'DATABASE' |> grepl(error) |> exceptions[['databaseNotFound']]()
    'UID'      |> grepl(error) |> exceptions[['uidNotFound']]()
    'PWD'      |> grepl(error) |> exceptions[['pwdNotFound']]()
  }
  exceptions[['dsnNotFound']]      <- \(invoke) {
    if(invoke) {
      stop("No DSN environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['driverNotFound']]   <- \(invoke) {
    if(invoke) {
      stop("No DRIVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['serverNotFound']]   <- \(invoke) {
    if(invoke) {
      stop("No SERVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['databaseNotFound']] <- \(invoke) {
    if(invoke) {
      stop("No DATABASE environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['uidNotFound']]      <- \(invoke) {
    if(invoke) {
      stop("No UID environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['pwdNotFound']]      <- \(invoke) {
    if(invoke) {
      stop("No PWD environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['drvIsNull']]        <- \() {}
  exceptions[['dsnIsNull']]        <- \() {}
  exceptions[['driverIsNull']]     <- \() {}
  exceptions[['serverIsNull']]     <- \() {}
  return(exceptions)
}