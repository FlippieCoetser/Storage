Memory.Storage.Logic.Validator <- \(broker = NULL) {
  exception <- Memory.Storage.Exceptions()

  validators <- list()
  validators[['Is.Existing.Table']] <- \(table) {
    broker[['Get.Tables']]() |> is.element(table) |> 
      isFALSE() |> exception[['Table.Invalid']](table)
    return(table)
  }
  validators[['Is.New.Entity']] <- \(entity, table) {
    match.count <- entity[['Id']] |> broker[['SelectWhereId']](table) |> nrow() 
    (match.count != 0) |> exception[['Key.Duplicate']]()
    return(entity)
  }
  validators[['Is.Existing.Entity']] <- \(entity, table) {
    match.count <- entity[['Id']] |> broker[['SelectWhereId']](table) |> nrow() 
    (match.count == 0) |> exception[['Entity.Not.Found']]()
    return(entity)
  }
  return(validators)
}