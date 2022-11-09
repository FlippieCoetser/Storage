ODBC.Storage.Exceptions <- \(){
    exception <- list()

    exception[["ConfigurationNull"]]    <- \(invoke) {
        if (invoke) {stop("Configuration provided is null. Provide valid configuration")}
    }
    exception[["ConfigurationMissing"]] <- \(invoke) {
        if (invoke) {stop("No configuration provided but required. Provide configuration")}
    }
    exception[["DSNIsNull"]]            <- \(invoke) {
        if (invoke) { stop("Configuration data frame has no DSN. Add DSN to configuration") }
    }
    exception[["UsernameIsNull"]]       <- \(invoke) {
        if (invoke) {stop("Configuration data frame has no Username. Add Username to configuration")}
    }
    exception[["PasswordIsNull"]]       <- \(invoke) {
        if (invoke) {stop("Configuration data frame has no Password. Add Password to configuration")}
    }

    exception[["ConnectionExceptions"]]  <- \(error) {
        '08001'  |> grepl(error) |> exception[["ServerUnreachable"]]()
        'IM002'  |> grepl(error) |> exception[["DataSourceNotFound"]]()
        '28000'  |> grepl(error) |> exception[["LoginFailedException"]]()

        return(NA)
    }
    exception[["ServerUnreachable"]]    <- \(invoke) {
        if (invoke) { stop("TCP Provider: Timeout error, Try again!") }
    }
    exception[["DataSourceNotFound"]]   <- \(invoke) {
        if (invoke) { stop("ODBC Driver: DSN Missing, but Required") }
    }
    exception[["LoginFailedException"]] <- \(invoke) {
        if (invoke) { stop("ODBC Driver: Login Failed, check credentials") }
    }

    exception[["QueryExceptions"]]       <- \(error) {
        '01000' |> grepl(error) |> exception[["DuplicateKey"]]()
        return(error)
    }
    exception[["DuplicateKey"]]         <- \(invoke) {
        if (invoke) { stop("SQL Error: Duplicate Id not allowed") }
    }

    return(exception)
}