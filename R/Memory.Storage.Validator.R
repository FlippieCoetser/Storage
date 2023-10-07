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
  validators[['Not.Implemented']]    <- \(input) {
    input |> exception[['Not.Implemented']]()
  }
  validators[['Is.New.Entity']]      <- \(entity) {
    tryCatch(
      entity |> validators[['Is.Empty']](),
      error=\(...) TRUE |> exception[['Key.Violation']]()
    ) 
  }
  validators[['Is.Existing.Entity']] <- \(entity) {
    tryCatch(
      entity |> validators[['Has.One.Row']](),
      error=\(...) TRUE |> exception[['Entity.Not.Found']]()
    )
    return(entity)
  }
  validators[['Is.Existing.Table']]  <- \(table) {
    tables <- broker[['Get.Tables']]()
    tables[['name']]    |> 
      is.element(table) |> 
      isFALSE()         |> 
      exception[['Table.Invalid']](table)
    return(table)
  }
  return(validators)
}