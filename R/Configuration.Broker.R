Configuration.Broker <- \() {
  utility <- Environment::Environment()

  operations <- list()
  operations[["OpenConfigFile"]]  <- \() {
    utility[["OpenConfigFile"]]()
  }
  operations[["GetPresetConfig"]] <- \() {
    configuration <- list()
    configuration[["DSN"]] <- "DSN" |> utility[["GetEnvVariable"]]()
    configuration[["UID"]] <- "UID" |> utility[["GetEnvVariable"]]()
    configuration[["PWD"]] <- "PWD" |> utility[["GetEnvVariable"]]()
    return(configuration)
  }
  operations[['GetManualConfig']] <- \() {}
  return(operations)
}