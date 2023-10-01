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
    return(input)
  }
  validators[['HasOneRow']]    <- \(input) {
    input |> nrow() |> (\(x) x != 1)() |> exception[['InvalidRows']](1)
  }
  validators[['Identifier']]   <- \() {}
  return(validators)
}