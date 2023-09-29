ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Exceptions()
  validators <- list()
  validators[['Entity']] <- \() {}
  validators[['Table']]  <- \() {}
  validators[['Query']]  <- \(query) {
    query |> is.null() |> exception[['QueryIsNull']]()
    return(query)
  }
  return(validators)
}