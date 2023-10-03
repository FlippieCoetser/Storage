ODBC.Storage.Exceptions <- \() {
  exceptions <- list()
  exceptions[["Config.NULL"]]        <- \(invoke) {
    if (invoke) {
      stop("Configuration provided is null. Provide valid configuration", call. = FALSE)
    }
  }
  exceptions[["Config.Missing"]]     <- \(invoke) {
    if (invoke) {
      stop("No configuration provided but required. Provide configuration", call. = FALSE)
    }
  }
  exceptions[['Dsn.NULL']]           <- \(invoke) {
    if (invoke) { 
      stop("Configuration has no DSN. Add DSN to configuration", call. = FALSE) 
    }
  }
  exceptions[['Uid.NULL']]           <- \(invoke) {
    if (invoke) {
      stop("Configuration has no UID. Add UID to configuration", call. = FALSE)
    }
  }
  exceptions[['Pwd.NULL']]           <- \(invoke) {
    if (invoke) {
      stop("Configuration has no PWD. Add PWD to configuration", call. = FALSE)
    }
  }
  exceptions[["Connection"]]         <- \(error) {
    '08001'  |> grepl(error) |> exceptions[["Server.Unreachable"]]()
    'IM002'  |> grepl(error) |> exceptions[["DSN.Invalid"]]()
    '28000'  |> grepl(error) |> exceptions[["Login.Failed"]]()

    return(NA)
  }
  exceptions[["Server.Unreachable"]] <- \(invoke) {
    if (invoke) { 
      stop("TCP Provider: Timeout error, Try again!", call. = FALSE) 
    }
  }
  exceptions[["DSN.Invalid"]]        <- \(invoke) {
    if (invoke) { 
      stop("ODBC Driver: Invalid DSN", call. = FALSE) 
    }
  }
  exceptions[["Login.Failed"]]       <- \(invoke) {
    if (invoke) { 
      stop("ODBC Driver: Login Failed, check credentials", call. = FALSE) 
    }
  }
  exceptions[["Query"]]              <- \(error) {
    'Violation of PRIMARY KEY constraint' |> 
    grepl(error) |> exceptions[["Key.Violation"]]()

    'Cannot insert the value NULL into column' |>
    grepl(error) |> exceptions[["Value.NULL"]]()

    'Conversion failed when converting from a character string to uniqueidentifier' |> 
    grepl(error) |> exceptions[["Conversion.Failed"]]()
    
    stop(error, call. = FALSE)
  }
  exceptions[["Key.Violation"]]      <- \(invoke) {
    if (invoke) { 
      stop("ODBC.Storage: Key.Violation: Duplicate Primary Key not allowed.", call. = FALSE) 
    }
  }
  exceptions[['Value.NULL']]         <- \(invoke) {
    if (invoke) { 
      stop("SQL Error: NULL value not allowed", call. = FALSE) 
    }
  }
  exceptions[['Conversion.Failed']]  <- \(invoke) {
    if (invoke) { 
      stop("SQL Error: Conversion from a character to unique identifier failed", call. = FALSE) 
    }
  }
  exceptions[['Query.NULL']]         <- \(invoke) {
    if(invoke) {
      stop('Query is null. Provide a Query.', call. = FALSE)
    } 
  }
  exceptions[['Table.Invalid']]      <- \(invoke, table) {
    if(invoke) {
      stop('ODBC.Storage: Table.Invalid: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  return(exceptions)
}