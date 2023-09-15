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
    exception[['dsnIsNull']]()
    return(configuration)
  }
  validations[['HasSERVER']]    <- \(configuration) {
  }
  validations[["HasUID"]]       <- \(configuration) {
    configuration[['uid']]    |>
    validations[["IsNull"]]() |>
    exception[['uidIsNull']]()
    return(configuration)
  }
  validations[["HasPWD"]]       <- \(configuration) {
    configuration[['pwd']]    |>
    validations[["IsNull"]]() |>
    exception[['pwdIsNull']]()
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