ODBC.Configuration.Validator <- \() {
  validations <- list()
  validations[['HasDsn']] <- \() {}
  validations[['HasDriver']] <- \() {}
  validations[['HasDatabase']] <- \() {}
  return(validations)
}