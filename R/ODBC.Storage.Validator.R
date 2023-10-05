ODBC.Storage.Validator <- \(broker = NULL) {
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
  validators[['Is.Existing.Table']] <- \(table) {
    tables <- broker[['Get.Tables']]() 
    any(tables[['name']] == table) |> isFALSE() |> exception[['Table.Invalid']](table)
    return(table)
  }
  return(validators)
}