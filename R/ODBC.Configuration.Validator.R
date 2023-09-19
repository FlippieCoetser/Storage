ODBC.Configuration.Validator <- \() {
  validations <- list()
  validations[['PresetConfig']] <- \() {}
  validations[['ManualConfig']] <- \() {}
  validations[['HasDrv']]       <- \() {}
  validations[['HasDsn']]       <- \() {}
  validations[['HasDriver']]    <- \() {}
  validations[['HasServer']]    <- \() {}
  validations[['HasDatabase']]  <- \() {}
  validations[['HasUid']]       <- \() {}
  validations[['HasPwd']]       <- \() {}
  return(validations)
}