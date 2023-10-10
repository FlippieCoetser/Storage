ODBC.Storage.Broker <- \(configuration, sql = Query::SQL()) {
  exception  <- ODBC.Storage.Exceptions()

  create.connection  <- \(configuration) {
    DBI::dbConnect |> do.call(configuration) |> 
      tryCatch(error=exception[['Connection']])
  }

  operations <- list()
  operations[['Execute.Query']]     <- \(query) {
    connection <- configuration |> create.connection()
    
    output <- connection |> DBI::dbGetQuery(query) |> 
      tryCatch(error = exception[['Query']])

    connection |> DBI::dbDisconnect()

    return(output)
  }
  operations[['Get.Tables']]        <- \() {
    query <- "SELECT TABLE_NAME as name FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"
    query |> operations[['Execute.Query']]()
  }
  operations[['Insert']]            <- \(entity, table) {
    table |>
    sql[['INSERT']](entity) |>
    sql[['VALUES']](entity) |>
    operations[['Execute.Query']]()
  }
  operations[['Select']]            <- \(table, fields = '*') {
    fields |>
    sql[['SELECT']]()    |>
    sql[['FROM']](table) |>
    operations[['Execute.Query']]()
  }
  operations[['SelectWhereId']]     <- \(id, table, fields = '*') {
    fields |>
      sql[['SELECT']]()        |>
      sql[['FROM']](table)     |>
      sql[['WHERE']]('id', id) |>
      operations[['Execute.Query']]()
  }
  operations[['Update']]            <- \(entity, table) {       
    table |>
    sql[['UPDATE']]()     |>
    sql[['SET']](entity)    |>
    sql[['WHERE']]('id', entity[['id']]) |>
    operations[['Execute.Query']]()
  }
  operations[['Delete']]            <- \(id, table) {
    sql[['DELETE']]()        |>
    sql[['FROM']](table)     |>
    sql[['WHERE']]('id', id) |>
    operations[['Execute.Query']]()
  }
  return(operations)
}
