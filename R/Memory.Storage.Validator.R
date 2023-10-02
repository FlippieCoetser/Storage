Memory.Storage.Validator <- \(broker = NULL) {
  exception <- Memory.Storage.Exceptions()

  validators <- Validate::Validator()
  validators[['Model']]              <- \(model) {
    model |> 
      validators[['Is.Not.NULL']]('model') |>
      validators[['Is.Data.Frame']]()      |>
      validators[['Is.Empty']]()
  }
  validators[['Table']]              <- \(table) {
    table |> 
      validators[['Is.Not.NULL']]('table') |>
      validators[['Is.Character']]()
  }
  validators[['Data']]               <- \(data) {
    data |> 
      validators[['Is.Not.NULL']]('data') |>
      validators[['Is.Data.Frame']]()     |>
      validators[['Is.Not.Empty']]()
  }
  validators[['Entity']]             <- \(entity) {
    entity |> 
      validators[['Is.Not.NULL']]('entity') |>
      validators[['Is.Data.Frame']]()       |>
      validators[['Has.One.Row']]()   
  }
  validators[['Id']]                 <- \(id) {
    id |> 
      validators[['Is.Not.NULL']]('id') |>
      validators[['Is.Character']]()    |>
      validators[['Is.UUID']]('id')
  }
  validators[['NoImplementation']]   <- \(input) {
    input |> exception[['NoExecute.Query']]()
  }
  validators[['Is.New.Entity']]      <- \(entity, table) {
    match.count <- entity[['Id']] |> broker[['SelectWhereId']](table) |> nrow() 
    (match.count != 0) |> exception[['DuplicateId']]()
    return(entity)
  }
  validators[['Is.Existing.Entity']] <- \(entity, table) {
    match.count <- entity[['Id']] |> broker[['SelectWhereId']](table) |> nrow() 
    (match.count == 0) |> exception[['Entity.Not.Found']]()
    return(entity)
  }
  validators[['Is.Existing.Table']]  <- \(table) {
    broker[['Get.Tables']]() |> 
      is.element(table)         |> 
      isFALSE()                 |> 
      exception[['Table.Invalid']](table)
    return(table)
  }
  return(validators)
}