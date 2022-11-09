Mock.Storage.Validation.Service <- \(){
    configuration.exception <- Mock.Storage.Exceptions()

    validate <- list()

    validate[["Configuration"]]         <- \(configuration) {
        configuration |>
            validate[["ConfigurationProvided"]]() |>
            validate[["ConfigurationExist"]]()

        return(configuration)
    }
    validate[["ConfigurationProvided"]] <- \(configuration) {
        configuration |>
            missing() |>
            configuration.exception[["ConfigurationMissing"]]()

        return(configuration)
    }
    validate[["ConfigurationExist"]]    <- \(configuration) {
        configuration |>
            is.null() |>
            configuration.exception[["ConfigurationNull"]]()

        return(configuration)
    }

    return(validate)
}