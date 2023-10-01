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
    return(input)
  }
  validators[['IsCharacters']] <- \() {}
  validators[['IsDataFrame']]  <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exception[['InvalidType']]('data.frame')
  }
  validators[['HasOneRow']]    <- \() {}
  validators[['Identifier']]   <- \() {}
  return(validators)
}