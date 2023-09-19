ODBC.Configuration.Validator <- \() {
  validations <- list()
  validations[['HasDrv']] <- \() {}
  validations[['HasDsn']] <- \() {}
  validations[['HasDriver']] <- \() {}
  validations[['HasDatabase']] <- \() {}
  return(validations)
}