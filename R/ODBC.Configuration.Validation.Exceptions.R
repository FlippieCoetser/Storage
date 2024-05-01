ODBC.Configuration.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['config.invalid']]     <- \(invoke) {
    if(invoke) {
      stop("Invalid ODBC configuration. Provide valid Preset or Manual configuration.", call. = FALSE)
    }
  }
  exceptions[['Configuration']]      <- \(error) {
    'DSN'      |> grepl(error) |> exceptions[['DSN.not.found']]()
    'DRIVER'   |> grepl(error) |> exceptions[['DRIVER.not.found']]()
    'SERVER'   |> grepl(error) |> exceptions[['SERVER.not.found']]()
    'DATABASE' |> grepl(error) |> exceptions[['DATABASE.not.found']]()
    'UID'      |> grepl(error) |> exceptions[['UID.not.found']]()
    'PWD'      |> grepl(error) |> exceptions[['PWD.not.found']]()
  }
  exceptions[['DSN.not.found']]      <- \(invoke) {
    if(invoke) {
      stop("No DSN environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['DRIVER.not.found']]   <- \(invoke) {
    if(invoke) {
      stop("No DRIVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['SERVER.not.found']]   <- \(invoke) {
    if(invoke) {
      stop("No SERVER environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['DATABASE.not.found']] <- \(invoke) {
    if(invoke) {
      stop("No DATABASE environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['UID.not.found']]      <- \(invoke) {
    if(invoke) {
      stop("No UID environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['PWD.not.found']]      <- \(invoke) {
    if(invoke) {
      stop("No PWD environment variable not found in .Renviron Configuration file.", call. = FALSE)
    }
  }
  exceptions[['drv.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("drv is NULL. Valid configuration requires a drv.", call. = FALSE)
    }
  }
  exceptions[['dsn.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("dsn is NULL. Valid configuration requires a dsn.", call. = FALSE)
    }
  }
  exceptions[['driver.NULL']]        <- \(invoke) {
    if(invoke) {
      stop("driver is NULL. Valid configuration requires a driver.", call. = FALSE)
    }
  }
  exceptions[['server.NULL']]        <- \(invoke) {
    if(invoke) {
      stop("server is NULL. Valid configuration requires a server.", call. = FALSE)
    }
  }
  exceptions[['database.NULL']]      <- \(invoke) {
    if(invoke) {
      stop("database is NULL. Valid configuration requires a database.", call. = FALSE)
    }
  }
  exceptions[['uid.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("uid is NULL. Valid configuration requires a uid.", call. = FALSE)
    }
  }
  exceptions[['pwd.NULL']]           <- \(invoke) {
    if(invoke) {
      stop("pwd is NULL. Valid configuration requires a pwd.", call. = FALSE)
    }
  }
  return(exceptions)
}