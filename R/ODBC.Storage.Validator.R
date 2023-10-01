ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Exceptions()
  validators <- list()
  validators[['Query']]        <- \(query) {
    query |> is.null() |> exception[['QueryIsNull']]()
    return(query)
  }
  validators[['Fields']]       <- \() {}
  validators[['Entity']]       <- \() {}
  validators[['Table']]        <- \() {}
  validators[['Id']]           <- \() {}
  validators[['NotNULL']]      <- \(input, name) {
    input |> is.null() |> exception[['IsNULL']](name)
  }
  validators[['IsCharacters']] <- \() {}
  validators[['IsDataFrame']]  <- \() {}
  validators[['HasOneRow']]    <- \() {}
  validators[['Identifier']]   <- \() {}
  return(validators)
}