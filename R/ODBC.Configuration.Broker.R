ODBC.Configuration.Broker <- \(environment = Environment::Environment()) {
  exception <- ODBC.Configuration.Exceptions()

  operations <- list()
  operations[['OpenConfigFile']]  <- \() {}
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