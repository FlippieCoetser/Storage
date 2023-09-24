Memory.Storage.Validator <- \(broker = NULL) {
  exception <- Memory.Storage.Exceptions()

  validators <- list()
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