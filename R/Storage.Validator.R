Storage.Validator <- \() {
  exception <- Storage.Exceptions()
  validators <- list()
  validators[['Query']] <- \(query) {
    query |> is.null() |> exception[['QueryIsNull']]()
    return(query)
  }
  return(validators)
}