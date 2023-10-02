ODBC.Storage.Broker <- \(configuration, sql = Query::SQL()) {
  exception  <- ODBC.Storage.Exceptions()

  operations <- list()
  operations[['Create.Connection']] <- \() {
    tryCatch(
      DBI::dbConnect |> do.call(configuration),
      error=exception[['Connection']]
    )
  }
  operations[['Execute.Query']]     <- \(query) {
    connection <- operations[['Create.Connection']]()
    
    output <- tryCatch(
        connection |> DBI::dbGetQuery(query),
        error = exception[['Query']]
    )

    connection |> DBI::dbDisconnect()

    return(output)
  }
  operations[['Insert']]            <- \(entity, table) {
    table |>
    sql[['INSERT']](entity) |>
    sql[['VALUES']](entity) |>
    operations[['Execute.Query']]()
  }
  operations[['Select']]            <- \(table, fields) {
    fields |>
    sql[['SELECT']]()    |>
    sql[['FROM']](table) |>
    operations[['Execute.Query']]()
  }
  operations[['SelectWhereId']]     <- \(id, table, fields) {
    fields |>
      sql[['SELECT']]()        |>
      sql[['FROM']](table)     |>
      sql[['WHERE']]('Id', id) |>
      operations[['Execute.Query']]()
  }
  operations[['Update']]            <- \(entity, table) {       
    table |>
    sql[['UPDATE']]()     |>
    sql[['SET']](entity)    |>
    sql[['WHERE']]('Id', entity[['Id']]) |>
    operations[['Execute.Query']]()
  }
  operations[['Delete']]            <- \(id, table) {
    sql[['DELETE']]()        |>
    sql[['FROM']](table)     |>
    sql[['WHERE']]('Id', id) |>
    operations[['Execute.Query']]()
  }
  return(operations)
}
