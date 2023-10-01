ODBC.Storage.Validator <- \() {
  exception <- ODBC.Storage.Exceptions()

  validators <- Validate::Validator()
  validators[['Query']]        <- \(query) {
    query |> is.null() |> exception[['QueryIsNull']]()
    return(query)
  }
  validators[['Fields']]       <- \() {}
  validators[['Entity']]       <- \(entity) {
    entity |> 
      validators[['Is.Not.NULL']]('entity') |>
      validators[['Is.Data.Frame']]()       |>
      validators[['Has.One.Row']]()   
  }
  validators[['Table']]        <- \(table) {
    table |> 
      validators[['Is.Not.NULL']]('table') |>
      validators[['Is.Character']]()
  }
  validators[['Id']]           <- \(id) {
    id |> 
      validators[['Is.Not.NULL']]('id') |>
      validators[['Is.Character']]()    |>
      validators[['Is.UUID']]('id')
  }
  return(validators)
}