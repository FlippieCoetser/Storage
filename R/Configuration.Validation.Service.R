Configuration.Validation.Service <- \() {
    exception <- Configuration.Exceptions()

    validate <- list()

    validate[["ODBCConfiguration"]] <- \(configuration) {
        configuration |>
            validate[["HasDSN"]]() |>
            validate[["HasUsername"]]() |>
            validate[["HasPassword"]]()

        return(configuration)
    }
    validate[["HasDSN"]]  <- \(configuration) {
        configuration[["DSN"]]     |> 
            validate[["IsNull"]]() |>
                exception[["DSNIsNull"]]()
        return(configuration)
    }
    validate[["HasUsername"]] <- \(configuration) {
        configuration[["Username"]] |>
            validate[["IsNull"]]()  |>
                exception[["UsernameIsNull"]]()

        return(configuration)
    }
    validate[["HasPassword"]] <- \(configuration) {
        configuration[["Password"]] |>
            validate[["IsNull"]]()  |>
                exception[["PasswordIsNull"]]()

        return(configuration)
    }
    validate[["IsEmpty"]] <- \(parameter) parameter |> (\(x){ x == "" })()
    validate[["IsNull"]]  <- \(parameter) parameter |> is.null()

  return(validate)
}