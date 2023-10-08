Memory.Storage.Validator <- \() {
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
    entity |> validators[['Is.Empty']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['Key.Violation']]()) 
  }
  validators[['Is.Existing.Entity']] <- \(entity) {
    entity |> validators[['Has.One.Row']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['Entity.Not.Found']]())
  }
  validators[['Is.Existing.Table']]  <- \(table, name = NULL) {
    table |> validators[['Has.One.Row']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['Table.Invalid']](name))
  }
  return(validators)
}