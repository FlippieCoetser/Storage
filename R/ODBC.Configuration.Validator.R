ODBC.Configuration.Validator <- \() {
  exception <- ODBC.Configuration.Exceptions()

  validations <- list()
  validations[['PresetConfig']] <- \() {}
  validations[['ManualConfig']] <- \() {}
  validations[['HasDrv']]       <- \(configuration) {
    configuration[['drv']] |> is.null() |> exception[['drvIsNull']]()
    return(configuration)
  }
  validations[['HasDsn']]       <- \(configuration) {
    configuration[['dsn']] |> is.null() |> exception[['dsnIsNull']]()
    return(configuration)
  }
  validations[['HasDriver']]    <- \(configuration) {
    configuration[['driver']] |> is.null() |> exception[['driverIsNull']]()
    return(configuration)
  }
  validations[['HasServer']]    <- \() {}
  validations[['HasDatabase']]  <- \() {}
  validations[['HasUid']]       <- \() {}
  validations[['HasPwd']]       <- \() {}
  return(validations)
}