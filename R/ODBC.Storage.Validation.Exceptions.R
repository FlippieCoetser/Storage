ODBC.Storage.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Config.NULL']]        <- \(invoke) {
    if (invoke) {
      stop("Configuration provided is null. Provide valid configuration", call. = FALSE)
    }
  }
  exceptions[['Config.Missing']]     <- \(invoke) {
    if (invoke) {
      stop("No configuration provided but required. Provide configuration", call. = FALSE)
    }
  }
  exceptions[['DSN.NULL']]           <- \(invoke) {
    if (invoke) { 
      stop("Configuration has no DSN. Add DSN to configuration", call. = FALSE) 
    }
  }
  exceptions[['UID.NULL']]           <- \(invoke) {
    if (invoke) {
      stop("Configuration has no UID. Add UID to configuration", call. = FALSE)
    }
  }
  exceptions[['PWD.NULL']]           <- \(invoke) {
    if (invoke) {
      stop("Configuration has no PWD. Add PWD to configuration", call. = FALSE)
    }
  }
  exceptions[['Connection']]         <- \(error) {
    '08001'  |> grepl(error) |> exceptions[["Server.Unreachable"]]()
    'IM002'  |> grepl(error) |> exceptions[["DSN.Invalid"]]()
    '28000'  |> grepl(error) |> exceptions[["Login.Failed"]]()

    return(NA)
  }
  exceptions[['Server.Unreachable']] <- \(invoke) {
    if (invoke) { 
      stop("TCP Provider: Timeout error, Try again!", call. = FALSE) 
    }
  }
  exceptions[['DSN.Invalid']]        <- \(invoke) {
    if (invoke) { 
      stop("ODBC Driver: Invalid DSN", call. = FALSE) 
    }
  }
  exceptions[['Login.Failed']]       <- \(invoke) {
    if (invoke) { 
      stop("ODBC Driver: Login Failed, check credentials", call. = FALSE) 
    }
  }
  exceptions[['Query']]              <- \(error) {
    'Violation of PRIMARY KEY constraint' |> 
    grepl(error) |> exceptions[["key.violation"]]()

    'Cannot insert the value NULL into column' |>
    grepl(error) |> exceptions[["Value.NULL"]]()

    'Conversion failed when converting from a character string to uniqueidentifier' |> 
    grepl(error) |> exceptions[["Conversion.Failed"]]()

    table <- sub(".*Invalid object name '[^\\.]+\\.([^']+)'.*", "\\1", error)
    "Invalid object name 'dbo.Invalid'." |>
    grepl(error) |> exceptions[["table.invalid"]](table)
    
    stop(error, call. = FALSE)
  }
  exceptions[['key.violation']]      <- \(invoke) {
    if (invoke) { 
      stop("ODBC.Storage: key.violation: Duplicate Primary Key not allowed.", call. = FALSE) 
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
  exceptions[['table.invalid']]      <- \(invoke, table) {
    if(invoke) {
      stop('ODBC.Storage: table.invalid: ', table, ' is not a valid table.', call. = FALSE)
    }
  }
  return(exceptions)
}