Configuration.Validator <- \() {
  exception <- Configuration.Exceptions()

  validations <- list()
  validations[["PresetConfig"]] <- \(configuration) {
    configuration |>
    validations[["HasDSN"]]() |>
    validations[["HasUID"]]() |>
    validations[["HasPWD"]]()
    return(configuration)
  }
  validations[["HasDSN"]]       <- \(configuration) {
    configuration[["DSN"]]    |> 
    validations[["IsNull"]]() |>
    exception[["DSNIsNull"]]()
    return(configuration)
  }
  validations[["HasUID"]]       <- \(configuration) {
    configuration[["UID"]]    |>
    validations[["IsNull"]]() |>
    exception[["UIDIsNull"]]()
    return(configuration)
  }
  validations[["HasPWD"]]       <- \(configuration) {
    configuration[["PWD"]]    |>
    validations[["IsNull"]]() |>
    exception[["PWDIsNull"]]()
    return(configuration)
  }
  validations[["IsEmpty"]]      <- \(parameter) {
    parameter |> (\(x){ x == "" })()
  } 
  validations[["IsNull"]]       <- \(parameter) {
    parameter |> is.null()
  } 
  return(validations)
}