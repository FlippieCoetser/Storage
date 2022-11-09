Mock.Storage.Exceptions <- \(){
    exception <- list()

    exception[["ConfigurationNull"]]    <- \(invoke) {
        if (invoke) {stop("Configuration provided is null. Provide valid configuration")}
    }
    exception[["ConfigurationMissing"]] <- \(invoke) {
        if (invoke) {stop("No configuration provided but required. Provide configuration")}
    }

    return(exception)
}