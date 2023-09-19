ODBC.Configuration.Validator <- \() {
  validations <- list()
  validations[['HasDrv']] <- \() {}
  validations[['HasDsn']] <- \() {}
  validations[['HasDriver']] <- \() {}
  validations[['HasServer']] <- \() {}
  validations[['HasDatabase']] <- \() {}
  return(validations)
}