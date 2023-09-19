ODBC.Configuration.Validator <- \() {
  exception <- ODBC.Configuration.Exceptions()

  validations <- list()
  validations[['PresetConfig']] <- \() {}
  validations[['ManualConfig']] <- \() {}
  validations[['HasDrv']]       <- \(configuration) {
    configuration[['drv']] |> is.null() |> exception[['drvIsNull']]()
  }
  validations[['HasDsn']]       <- \() {}
  validations[['HasDriver']]    <- \() {}
  validations[['HasServer']]    <- \() {}
  validations[['HasDatabase']]  <- \() {}
  validations[['HasUid']]       <- \() {}
  validations[['HasPwd']]       <- \() {}
  return(validations)
}