Configuration.Broker <- \() {
  utility <- Environment::Environment()

  operations <- list()
  operations[["OpenConfigFile"]]  <- \() {
    utility[["OpenConfigFile"]]()
  }
  operations[["GetPresetConfig"]] <- \() {
    configuration <- list()
    configuration[['dsn']] <- "DSN" |> utility[["GetEnvVariable"]]()
    configuration[['uid']] <- "UID" |> utility[["GetEnvVariable"]]()
    configuration[['pwd']] <- "PWD" |> utility[["GetEnvVariable"]]()
    return(configuration)
  }
  operations[['GetManualConfig']] <- \() {
    configuration <- list()
    configuration[['DRIVER']]   <- "DRIVER" |> utility[['GetEnvVariable']]()
    configuration[['SERVER']]   <- "SERVER" |> utility[['GetEnvVariable']]()
    configuration[['DATABASE']] <- "DATABASE" |> utility[['GetEnvVariable']]()
    configuration[['uid']]      <- "UID" |> utility[['GetEnvVariable']]()
    configuration[['pwd']]      <- "PWD" |> utility[['GetEnvVariable']]()
    return(configuration)
  }
  return(operations)
}