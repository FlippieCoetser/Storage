Storage.Configuration.Broker <- \() {
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
    configuration[['driver']]   <- "DRIVER" |> utility[['GetEnvVariable']]()
    configuration[['server']]   <- "SERVER" |> utility[['GetEnvVariable']]()
    configuration[['database']] <- "DATABASE" |> utility[['GetEnvVariable']]()
    configuration[['uid']]      <- "UID" |> utility[['GetEnvVariable']]()
    configuration[['pwd']]      <- "PWD" |> utility[['GetEnvVariable']]()
    return(configuration)
  }
  return(operations)
}