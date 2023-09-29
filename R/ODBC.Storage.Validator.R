ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Exceptions()
  validators <- list()
  validators[['Entity']] <- \() {}
  validators[['Query']]  <- \(query) {
    query |> is.null() |> exception[['QueryIsNull']]()
    return(query)
  }
  return(validators)
}