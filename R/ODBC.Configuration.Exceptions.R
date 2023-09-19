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
  exceptions[['drvIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("drv is NULL. Valid configuration requires a drv.", call. = FALSE)
    }
  }
  exceptions[['dsnIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("dsn is NULL. Valid configuration requires a dsn.", call. = FALSE)
    }
  }
  exceptions[['driverIsNull']]     <- \(invoke) {
    if(invoke) {
      stop("driver is NULL. Valid configuration requires a driver.", call. = FALSE)
    }
  }
  exceptions[['serverIsNull']]     <- \(invoke) {
    if(invoke) {
      stop("server is NULL. Valid configuration requires a server.", call. = FALSE)
    }
  }
  exceptions[['databaseIsNull']]   <- \(invoke) {
    if(invoke) {
      stop("database is NULL. Valid configuration requires a database.", call. = FALSE)
    }
  }
  exceptions[['uidIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("uid is NULL. Valid configuration requires a uid.", call. = FALSE)
    }
  }
  exceptions[['pwdIsNull']]        <- \() {}
  return(exceptions)
}