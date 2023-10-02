Memory.Storage.Logic.Validator <- \(broker = NULL) {
  exception <- Memory.Storage.Exceptions()

  validators <- list()
  validators[['Is.Existing.Table']] <- \(table) {
    broker[['Get.Tables']]() |> is.element(table) |> 
      isFALSE() |> exception[['Table.Invalid']](table)
    return(table)
  }
  validators[['Is.New.Entity']] <- \() {}
  return(validators)
}