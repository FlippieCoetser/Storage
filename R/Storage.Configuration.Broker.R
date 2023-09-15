Storage.Configuration.Broker <- \() {
  utility <- Environment::Environment()
  exception <- Storage.Configuration.Exceptions()

  operations <- list()
  operations[['OpenConfigFile']]  <- \() {
    utility[['OpenConfigFile']]()
  }
  operations[['GetPresetConfig']] <- \() {
    tryCatch({
      configuration <- list()
      configuration[['dsn']] <- 'DSN' |> utility[['GetEnvVariable']]()
      configuration[['uid']] <- 'UID' |> utility[['GetEnvVariable']]()
      configuration[['pwd']] <- 'PWD' |> utility[['GetEnvVariable']]()
      return(configuration)
    }, 
    error = exception[['Configuration']])
  }
  operations[['GetManualConfig']] <- \() {
    tryCatch({
    configuration <- list()
    configuration[['driver']]   <- 'DRIVER' |> utility[['GetEnvVariable']]()
    configuration[['server']]   <- 'SERVER' |> utility[['GetEnvVariable']]()
    configuration[['database']] <- 'DATABASE' |> utility[['GetEnvVariable']]()
    configuration[['uid']]      <- 'UID' |> utility[['GetEnvVariable']]()
    configuration[['pwd']]      <- 'PWD' |> utility[['GetEnvVariable']]()
    return(configuration)},
    error = exception[['Configuration']])
  }
  return(operations)
}