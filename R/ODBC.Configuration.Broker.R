ODBC.Configuration.Broker <- \(environment = Environment::Environment()) {
  exception <- ODBC.Configuration.Exceptions()

  operations <- list()
  # TODO: Refactor -> Open.Config.File
  operations[['OpenConfigFile']]  <- \() {
    environment[['OpenConfigFile']]()
  }
  # TODO: Refactor -> Get.Preset.Config
  operations[['GetPresetConfig']] <- \() {
    tryCatch(
      list(
        drv = odbc::odbc(),
        dsn = 'DSN' |> environment[['GetEnvVariable']](),
        uid = 'UID' |> environment[['GetEnvVariable']](),
        pwd = 'PWD' |> environment[['GetEnvVariable']]()
      ), 
    error = exception[['Configuration']])
  }
  # TODO: Refactor -> Get.Manual.Config
  operations[['GetManualConfig']] <- \() {
    tryCatch(
      list(
        drv      = odbc::odbc(),
        driver   = 'DRIVER'   |> environment[['GetEnvVariable']](),
        server   = 'SERVER'   |> environment[['GetEnvVariable']](),
        database = 'DATABASE' |> environment[['GetEnvVariable']](),
        uid      = 'UID'      |> environment[['GetEnvVariable']](),
        pwd      = 'PWD'      |> environment[['GetEnvVariable']]()
      ), 
    error = exception[['Configuration']])
  }
  return(operations)
}