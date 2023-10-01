ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  # TODO: Refactor -> Config.Invalid
  exceptions[['InvalidConfig']]    <- \(invoke) {
    if(invoke) {
      stop("Invalid ODBC configuration. Provide valid Preset or Manual configuration.", call. = FALSE)
    }
  }
  exceptions[['Configuration']]    <- \(error) {
    'DSN'      |> grepl(error) |> exceptions[['dsnNotFound']]()
    'DRIVER'   |> grepl(error) |> exceptions[['driverNotFound']]()
    'SERVER'   |> grepl(error) |> exceptions[['serverNotFound']]()
    'DATABASE' |> grepl(error) |> exceptions[['databaseNotFound']]()
    'UID'      |> grepl(error) |> exceptions[['uidNotFound']]()
    'PWD'      |> grepl(error) |> exceptions[['pwdNotFound']]()
  }
  # TODO: Refactor -> Dsn.Not.Found
  exceptions[['dsnNotFound']]      <- \(invoke) {
    if(invoke) {
      stop("No DSN environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Driver.Not.Found
  exceptions[['driverNotFound']]   <- \(invoke) {
    if(invoke) {
      stop("No DRIVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Server.Not.Found
  exceptions[['serverNotFound']]   <- \(invoke) {
    if(invoke) {
      stop("No SERVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Database.Not.Found
  exceptions[['databaseNotFound']] <- \(invoke) {
    if(invoke) {
      stop("No DATABASE environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Uid.Not.Found
  exceptions[['uidNotFound']]      <- \(invoke) {
    if(invoke) {
      stop("No UID environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Pwd.Not.Found
  exceptions[['pwdNotFound']]      <- \(invoke) {
    if(invoke) {
      stop("No PWD environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Drv.NULL
  exceptions[['drvIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("drv is NULL. Valid configuration requires a drv.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Dsn.NULL
  exceptions[['dsnIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("dsn is NULL. Valid configuration requires a dsn.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Driver.NULL
  exceptions[['driverIsNull']]     <- \(invoke) {
    if(invoke) {
      stop("driver is NULL. Valid configuration requires a driver.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Server.NULL
  exceptions[['serverIsNull']]     <- \(invoke) {
    if(invoke) {
      stop("server is NULL. Valid configuration requires a server.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Database.NULL
  exceptions[['databaseIsNull']]   <- \(invoke) {
    if(invoke) {
      stop("database is NULL. Valid configuration requires a database.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Uid.NULL
  exceptions[['uidIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("uid is NULL. Valid configuration requires a uid.", call. = FALSE)
    }
  }
  # TODO: Refactor -> Pwd.NULL
  exceptions[['pwdIsNull']]        <- \(invoke) {
    if(invoke) {
      stop("pwd is NULL. Valid configuration requires a pwd.", call. = FALSE)
    }
  }
  return(exceptions)
}