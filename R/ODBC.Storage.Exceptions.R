ODBC.Storage.Exceptions <- \() {
  exceptions <- list()
  # TODO: Refactor -> Config.NULL
  exceptions[["ConfigIsNull"]]       <- \(invoke) {
    if (invoke) {
      stop("Configuration provided is null. Provide valid configuration", call. = FALSE)
    }
  }
  # TODO: Refactor -> Config.Missing
  exceptions[["ConfigIsMissing"]]    <- \(invoke) {
    if (invoke) {
      stop("No configuration provided but required. Provide configuration", call. = FALSE)
    }
  }
  # TODO: Refactor -> Dsn.NULL
  exceptions[['dsnIsNull']]          <- \(invoke) {
    if (invoke) { 
      stop("Configuration has no DSN. Add DSN to configuration", call. = FALSE) 
    }
  }
  # TODO: Refactor -> Uid.NULL
  exceptions[['uidIsNull']]          <- \(invoke) {
    if (invoke) {
      stop("Configuration has no UID. Add UID to configuration", call. = FALSE)
    }
  }
  # TODO: Refactor -> Pwd.NULL
  exceptions[['pwdIsNull']]          <- \(invoke) {
    if (invoke) {
      stop("Configuration has no PWD. Add PWD to configuration", call. = FALSE)
    }
  }
  exceptions[["Connection"]]         <- \(error) {
    '08001'  |> grepl(error) |> exceptions[["ServerUnreachable"]]()
    'IM002'  |> grepl(error) |> exceptions[["InvalidDSN"]]()
    '28000'  |> grepl(error) |> exceptions[["LoginFailed"]]()

    return(NA)
  }
  # TODO: Refactor -> Server.Unreachable
  exceptions[["ServerUnreachable"]]  <- \(invoke) {
    if (invoke) { 
      stop("TCP Provider: Timeout error, Try again!", call. = FALSE) 
    }
  }
  # TODO: Refactor -> Invalid.DSN
  exceptions[["InvalidDSN"]]         <- \(invoke) {
    if (invoke) { 
      stop("ODBC Driver: Invalid DSN", call. = FALSE) 
    }
  }
  # TODO: Refactor -> Login.Failed
  exceptions[["LoginFailed"]]        <- \(invoke) {
    if (invoke) { 
      stop("ODBC Driver: Login Failed, check credentials", call. = FALSE) 
    }
  }
  exceptions[["Query"]]              <- \(error) {
    'Violation of PRIMARY KEY constraint' |> 
    grepl(error) |> exceptions[["DuplicateKey"]]()

    'Cannot insert the value NULL into column' |>
    grepl(error) |> exceptions[["NullValue"]]()

    'Conversion failed when converting from a character string to uniqueidentifier' |> 
    grepl(error) |> exceptions[["ConversionFailed"]]()
    
    stop(error, call. = FALSE)
  }
  # TODO: Refactor -> Duplicate.Key
  exceptions[["DuplicateKey"]]       <- \(invoke) {
    if (invoke) { 
      stop("SQL Error: Duplicate Id not allowed", call. = FALSE) 
    }
  }
  # TODO: Refactor -> Value.NULL
  exceptions[['NullValue']]          <- \(invoke) {
    if (invoke) { 
      stop("SQL Error: NULL value not allowed", call. = FALSE) 
    }
  }
  # TODO: Refactor -> Conversion.Failed
  exceptions[['ConversionFailed']]   <- \(invoke) {
    if (invoke) { 
      stop("SQL Error: Conversion from a character to unique identifier failed", call. = FALSE) 
    }
  }
  # TODO: Refactor -> Query.NULL
  exceptions[['QueryIsNull']]        <- \(invoke) {
    if(invoke) {
      stop('Query is null. Provide a Query.', call. = FALSE)
    } 
  }
  return(exceptions)
}