Storage.Configuration.Validator <- \() {
  exception <- Storage.Configuration.Exceptions()

  validations <- list()
  validations[["PresetConfig"]] <- \(configuration) {
    configuration |>
    validations[["HasDSN"]]() |>
    validations[["HasUID"]]() |>
    validations[["HasPWD"]]()
    return(configuration)
  }
  validations[["HasDSN"]]       <- \(configuration) {
    configuration[['dsn']]    |> 
    validations[["IsNull"]]() |>
    exception[["DSNIsNull"]]()
    return(configuration)
  }
  validations[["HasUID"]]       <- \(configuration) {
    configuration[['uid']]    |>
    validations[["IsNull"]]() |>
    exception[["UIDIsNull"]]()
    return(configuration)
  }
  validations[["HasPWD"]]       <- \(configuration) {
    configuration[['pwd']]    |>
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