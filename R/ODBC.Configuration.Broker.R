ODBC.Configuration.Broker <- \(environment = Environment::Environment()) {
  exception <- ODBC.Configuration.Exceptions()

  operations <- list()
  operations[['Open.Config.File']]  <- \() {
    environment[['Open.Config.File']]()
  }
  operations[['Get.Preset.Config']] <- \() {
    list(
      drv = odbc::odbc(),
      dsn = 'DSN' |> environment[['Get.Env.Variable']](),
      uid = 'UID' |> environment[['Get.Env.Variable']](),
      pwd = 'PWD' |> environment[['Get.Env.Variable']]()
    ) |> tryCatch(error = exception[['Configuration']])
  }
  operations[['Get.Manual.Config']] <- \() {
    list(
      drv      = odbc::odbc(),
      driver   = 'DRIVER'   |> environment[['Get.Env.Variable']](),
      server   = 'SERVER'   |> environment[['Get.Env.Variable']](),
      database = 'DATABASE' |> environment[['Get.Env.Variable']](),
      uid      = 'UID'      |> environment[['Get.Env.Variable']](),
      pwd      = 'PWD'      |> environment[['Get.Env.Variable']]()
    ) |> tryCatch(error = exception[['Configuration']])
  }
  return(operations)
}