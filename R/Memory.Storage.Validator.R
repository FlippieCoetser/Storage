Memory.Storage.Validator <- \() {
  exception <- Memory.Storage.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Model']]              <- \(model) {
    model |> 
      validators[['is.not.NULL']]('model') |>
      validators[['is.data.frame']]()      |>
      validators[['is.empty']]()
  }
  validators[['Table']]              <- \(table) {
    table |> 
      validators[['is.not.NULL']]('table') |>
      validators[['is.character']]()
  }
  validators[['Data']]               <- \(data) {
    data |> 
      validators[['is.not.NULL']]('data') |>
      validators[['is.data.frame']]()     |>
      validators[['is.not.empty']]()
  }
  validators[['Entity']]             <- \(entity) {
    entity |> 
      validators[['is.not.NULL']]('entity') |>
      validators[['is.data.frame']]()       |>
      validators[['has.one.row']]()   
  }
  validators[['Id']]                 <- \(id) {
    id |> 
      validators[['is.not.NULL']]('id') |>
      validators[['is.character']]()    |>
      validators[['is.UUID']]('id')
  }
  validators[['not.implemented']]    <- \(input) {
    input |> exception[['not.implemented']]()
  }
  validators[['is.new.entity']]      <- \(entity) {
    entity |> validators[['is.empty']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['key.violation']]()) 
  }
  validators[['is.existing.entity']] <- \(entity) {
    entity |> validators[['has.one.row']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['entity.not.found']]())
  }
  validators[['is.existing.table']]  <- \(table, name = NULL) {
    table |> validators[['has.one.row']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['table.invalid']](name))
  }
  return(validators)
}