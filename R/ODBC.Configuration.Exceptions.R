ODBC.Configuration.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Config.Invalid']]     <- \(invoke) {
    if(invoke) {
      stop("Invalid ODBC configuration. Provide valid Preset or Manual configuration.", call. = FALSE)
    }
  }
  exceptions[['Configuration']]      <- \(error) {
    'DSN'      |> grepl(error) |> exceptions[['Dsn.Not.Found']]()
    'DRIVER'   |> grepl(error) |> exceptions[['Driver.Not.Found']]()
    'SERVER'   |> grepl(error) |> exceptions[['Server.Not.Found']]()
    'DATABASE' |> grepl(error) |> exceptions[['Database.Not.Found']]()
    'UID'      |> grepl(error) |> exceptions[['Uid.Not.Found']]()
    'PWD'      |> grepl(error) |> exceptions[['Pwd.Not.Found']]()
  }
  exceptions[['Dsn.Not.Found']]      <- \(invoke) {
    if(invoke) {
      stop("No DSN environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['Driver.Not.Found']]   <- \(invoke) {
    if(invoke) {
      stop("No DRIVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['Server.Not.Found']]   <- \(invoke) {
    if(invoke) {
      stop("No SERVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['Database.Not.Found']] <- \(invoke) {
    if(invoke) {
      stop("No DATABASE environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['Uid.Not.Found']]      <- \(invoke) {
    if(invoke) {
      stop("No UID environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['Pwd.Not.Found']]      <- \(invoke) {
    if(invoke) {
      stop("No PWD environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['Drv.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("drv is NULL. Valid configuration requires a drv.", call. = FALSE)
    }
  }
  exceptions[['Dsn.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("dsn is NULL. Valid configuration requires a dsn.", call. = FALSE)
    }
  }
  exceptions[['Driver.NULL']]        <- \(invoke) {
    if(invoke) {
      stop("driver is NULL. Valid configuration requires a driver.", call. = FALSE)
    }
  }
  exceptions[['Server.NULL']]        <- \(invoke) {
    if(invoke) {
      stop("server is NULL. Valid configuration requires a server.", call. = FALSE)
    }
  }
  exceptions[['Database.NULL']]      <- \(invoke) {
    if(invoke) {
      stop("database is NULL. Valid configuration requires a database.", call. = FALSE)
    }
  }
  exceptions[['Uid.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("uid is NULL. Valid configuration requires a uid.", call. = FALSE)
    }
  }
  exceptions[['Pwd.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("pwd is NULL. Valid configuration requires a pwd.", call. = FALSE)
    }
  }
  return(exceptions)
}