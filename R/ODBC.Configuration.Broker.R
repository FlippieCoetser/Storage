ODBC.Configuration.Broker <- \(environment = Environment::Configurator()) {
  exception <- ODBC.Configuration.Validation.Exceptions()

  operations <- list()
  operations[['open.config.file']]  <- \() {
    environment[['open.config.file']]()
  }
  operations[['get.preset.config']] <- \() {
    list(
      drv = odbc::odbc(),
      dsn = 'DSN' |> environment[['get.env.variable']](),
      uid = 'UID' |> environment[['get.env.variable']](),
      pwd = 'PWD' |> environment[['get.env.variable']]()
    ) |> tryCatch(error = exception[['Configuration']])
  }
  operations[['get.manual.config']] <- \() {
    list(
      drv      = odbc::odbc(),
      driver   = 'DRIVER'   |> environment[['get.env.variable']](),
      server   = 'SERVER'   |> environment[['get.env.variable']](),
      database = 'DATABASE' |> environment[['get.env.variable']](),
      uid      = 'UID'      |> environment[['get.env.variable']](),
      pwd      = 'PWD'      |> environment[['get.env.variable']]()
    ) |> tryCatch(error = exception[['Configuration']])
  }
  return(operations)
}