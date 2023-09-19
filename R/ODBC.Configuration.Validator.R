ODBC.Configuration.Validator <- \() {
  validations <- list()
  validations[['HasDsn']] <- \() {}
  validations[['HasDriver']] <- \() {}
  return(validations)
}