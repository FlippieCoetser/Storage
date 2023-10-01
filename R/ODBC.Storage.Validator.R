ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Exceptions()
  validators <- list()
  validators[['Query']]        <- \(query) {
    query |> is.null() |> exception[['QueryIsNull']]()
    return(query)
  }
  validators[['Fields']]       <- \() {}
  validators[['Entity']]       <- \(input) {
    input |> 
      validators[['NotNULL']]('entity') |>
      validators[['IsDataFrame']]()     |>
      validators[['HasOneRow']]()   
  }
  validators[['Table']]        <- \() {}
  validators[['Id']]           <- \() {}
  validators[['NotNULL']]      <- \(input, name) {
    input |> is.null() |> exception[['IsNULL']](name)
    return(input)
  }
  validators[['IsCharacters']] <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['InvalidType']]('character')
    return(input)
  }
  validators[['IsDataFrame']]  <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exception[['InvalidType']]('data.frame')
    return(input)
  }
  validators[['HasOneRow']]    <- \(input) {
    input |> nrow() |> (\(x) x != 1)() |> exception[['InvalidRows']](1)
    return(input)
  }
  validators[['Identifier']]   <- \() {}
  return(validators)
}