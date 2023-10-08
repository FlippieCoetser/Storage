ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Exceptions()

  validators <- Validate::Validator()
  validators[['Query']]  <- \(query) {
    query |> is.null() |> exception[['Query.NULL']]()
    return(query)
  }
  validators[['Fields']] <- \() {}
  validators[['Entity']] <- \(entity) {
    entity |> 
      validators[['Is.Not.NULL']]('entity') |>
      validators[['Is.Data.Frame']]()       |>
      validators[['Has.One.Row']]()   
  }
  validators[['Table']]  <- \(table) {
    table |> 
      validators[['Is.Not.NULL']]('table') |>
      validators[['Is.Character']]()
  }
  validators[['Id']]     <- \(id) {
    id |> 
      validators[['Is.Not.NULL']]('id') |>
      validators[['Is.Character']]()    |>
      validators[['Is.UUID']]('id')
  }
  validators[['Is.Existing.Table']] <- \(table, name = NULL) {
    table |> validators[['Has.One.Row']]() |> 
      tryCatch(error=\(...) TRUE |> exception[['Table.Invalid']](name))
  }
  return(validators)
}