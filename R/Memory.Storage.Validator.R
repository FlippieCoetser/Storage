Memory.Storage.Validator <- \(broker = NULL) {
  exception <- Memory.Storage.Exceptions()

  validators <- list()
  validators[['Model']]            <- \(model) {
    model |> 
      validators[['NotNULL']]('model') |>
      validators[['IsDataFrame']]()    |>
      validators[['IsEmpty']]()
  }
  validators[['Table']]            <- \(table) {
    table |> 
      validators[['NotNULL']]('table') |>
      validators[['IsCharacters']]()
  }
  validators[['NotNULL']]          <- \(input, name) {
    input |> is.null() |> exception[['IsNULL']](name)
    return(input)
  }
  validators[['IsDataFrame']]      <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exception[['InvalidType']]('data.frame')
    return(input)
  }
  validators[['IsCharacters']]     <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['InvalidType']]('character')
    return(input)
  }
  validators[['IsEmpty']]          <- \(input) {
    input |> nrow() |> (\(x) x != 0)() |> exception[['InvalidRows']](0)
    return(input)
  }
  validators[['NoImplementation']] <- \() {
    TRUE |> exception[['NoExecuteQuery']]()
  }
  validators[['IsNewEntity']]      <- \(entity, table) {
    match.count <- entity[['Id']] |> broker[['SelectWhereId']](table) |> nrow() 
    (match.count != 0) |> exception[['DuplicateId']]()
    return(entity)
  }
  validators[['EntityExist']]      <- \(entity, table) {
    match.count <- entity[['Id']] |> broker[['SelectWhereId']](table) |> nrow() 
    (match.count == 0) |> exception[['EntityNotFound']]()
    return(entity)
  }
  validators[['IsValidTable']]     <- \(table) {
    broker[['GetTableNames']]() |> 
      is.element(table)         |> 
      isFALSE()                 |> 
      exception[['InvalidTable']](table)
    return(table)
  }
  return(validators)
}