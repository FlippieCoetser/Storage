Storage.Configuration.Exceptions <- \() {
  exception <- list()
  exception[['dsnIsNull']]     <- \(invoke) {
    if (invoke) {
      stop('Configuration has no dsn', call. = FALSE)
    }
  }
  exception[['driverIsNull']]  <- \(invoke) {
    if (invoke) {
      stop('Configuration has no driver.', call. = FALSE)
    }
  }
  exception[['serverIsNull']]  <- \() {}
  exception[['uidIsNull']]     <- \(invoke) {
    if (invoke) {
      stop('Configuration has no uid', call. = FALSE)
    }
  }
  exception[['pwdIsNull']]     <- \(invoke) {
    if (invoke) {
      stop('Configuration has no pwd', call. = FALSE)
    }
  }
  exception[['Configuration']] <- \(error) {
    'DSN'      |> grepl(error) |> exception[['NoDSN']]()
    'DRIVER'   |> grepl(error) |> exception[['NoDRIVER']]()
    'SERVER'   |> grepl(error) |> exception[['NoSERVER']]()
    'DATABASE' |> grepl(error) |> exception[['NoDATABASE']]()
    'UID'      |> grepl(error) |> exception[['NoUID']]()
    'PWD'      |> grepl(error) |> exception[['NoPWD']]()
    stop(error, call. = FALSE)
  }
  exception[['NoDSN']]         <- \(invoke) {
    if (invoke) {
      stop('No DSN environment variable defined. check .Renviron file.', call. = FALSE)
    }
  }
  exception[['NoDRIVER']]      <- \(invoke) {
    if (invoke) {
      stop('No DRIVER environment variable defined. check .Renviron file.', call. = FALSE)
    }
  }
  exception[['NoSERVER']]      <- \(invoke) {
    if (invoke) {
      stop('No SERVER environment variable defined. check .Renviron file.', call. = FALSE)
    }
  }
  exception[['NoDATABASE']]    <- \(invoke) {
    if (invoke) {
      stop('No DATABASE environment variable defined. check .Renviron file.', call. = FALSE)
    }
  }
  exception[['NoUID']]         <- \(invoke) {
    if (invoke) {
      stop('No UID environment variable defined. check .Renviron file.', call. = FALSE)
    }
  }
  exception[['NoPWD']]         <- \(invoke) {
    if (invoke) {
      stop('No PWD environment variable defined. check .Renviron file.', call. = FALSE)
    }
  }
  return(exception)
}