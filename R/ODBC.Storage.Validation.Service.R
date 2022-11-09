ODBC.Storage.Validation.Service <- \(){
    configuration.exception <- ODBC.Storage.Exceptions()
    mode.exception <- Model.Exceptions()

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
    validate[["HasDSN"]]                <- \(configuration) {
      configuration[["DSN"]] |>
        is.null() |> configuration.exception[["DSNIsNull"]]()

      return(configuration)
    }
    validate[["HasUsername"]]           <- \(configuration) {
      configuration[["Username"]] |>
        is.null() |>
        configuration.exception[["UsernameIsNull"]]()
      return(configuration)
    }
    validate[["HasPassword"]]           <- \(configuration) {
      configuration[["Password"]] |>
        is.null() |>
        configuration.exception[["PasswordIsNull"]]()
      return(configuration)
    }

    return(validate)
}