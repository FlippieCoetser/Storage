ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Query']]             <- \(query) {
    query |> is.null() |> exception[['Query.NULL']]()
    return(query)
  }
  validators[['Fields']]            <- \() {}
  validators[['Entity']]            <- \(entity) {
    entity |> 
      validators[['is.not.NULL']]('entity') |>
      validators[['is.data.frame']]()       |>
      validators[['has.one.row']]()   
  }
  validators[['Table']]             <- \(table) {
    table |> 
      validators[['is.not.NULL']]('table') |>
      validators[['is.character']]()
  }
  validators[['Id']]                <- \(id) {
    id |> 
      validators[['is.not.NULL']]('id') |>
      validators[['is.character']]()    |>
      validators[['is.UUID']]('id')
  }
  validators[['is.existing.table']] <- \(table, name = NULL) {
    table |> validators[['has.one.row']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['table.invalid']](name))
  }
  return(validators)
}