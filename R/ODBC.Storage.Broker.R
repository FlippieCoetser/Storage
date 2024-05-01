ODBC.Storage.Broker <- \(configuration, sql = Query::SQL()) {
  exception  <- ODBC.Storage.Validation.Exceptions()

  create.connection  <- \(configuration) {
    DBI::dbConnect |> do.call(configuration) |> 
      tryCatch(error=exception[['Connection']])
  }

  operations <- list()
  operations[['execute.query']]     <- \(query) {
    connection <- configuration |> create.connection()
    
    output <- connection |> DBI::dbGetQuery(query) |> 
      tryCatch(error = exception[['Query']])

    connection |> DBI::dbDisconnect()

    return(output)
  }
  operations[['get.tables']]        <- \() {
    query <- "SELECT TABLE_NAME as name FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"
    query |> operations[['execute.query']]()
  }
  operations[['insert']]            <- \(entity, table) {
    table |>
    sql[['INSERT']](entity) |>
    sql[['VALUES']](entity) |>
    operations[['execute.query']]()
  }
  operations[['select']]            <- \(table, fields = '*') {
    fields |>
    sql[['SELECT']]()    |>
    sql[['FROM']](table) |>
    operations[['execute.query']]()
  }
  operations[['select.where.Id']]     <- \(id, table, fields = '*') {
    fields |>
      sql[['SELECT']]()        |>
      sql[['FROM']](table)     |>
      sql[['WHERE']]('id', id) |>
      operations[['execute.query']]()
  }
  operations[['update']]            <- \(entity, table) {       
    table |>
    sql[['UPDATE']]()     |>
    sql[['SET']](entity)    |>
    sql[['WHERE']]('id', entity[['id']]) |>
    operations[['execute.query']]()
  }
  operations[['delete']]            <- \(id, table) {
    sql[['DELETE']]()        |>
    sql[['FROM']](table)     |>
    sql[['WHERE']]('id', id) |>
    operations[['execute.query']]()
  }
  return(operations)
}
