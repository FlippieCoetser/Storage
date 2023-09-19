ODBC.Configuration.Validator <- \() {
  validations <- list()
  validations[['HasDsn']] <- \() {}
  return(validations)
}