#' ODBC Storage Broker
#'
#' @description
#' Provide a ODBC based storage interface with basic CRUD Operations.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `ExecuteQuery(query)`
#' * `Insert(entity, table)`
#' * `Select(fields, table)`
#' * `SelectWhereId(fields, table, id)`
#' * `Update(entity, table)`
#' * `Delete(id, table)`
#' @export
ODBC.Storage.Broker <- \(configuration){
  exception  <- Storage.Exceptions()

  sql <- Query::SQL()

  operations <- list()
  operations[['CreateConnection']]  <- \() {
    tryCatch(
      DBI::dbConnect |> do.call(configuration),
      error=exception[['Connection']]
    )
  }
  operations[['ExecuteQuery']]      <- \(query) {
    connection <- operations[['CreateConnection']]()
    
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
    operations[['ExecuteQuery']]()
  }
  operations[['Select']]            <- \(fields, table) {
    fields |>
    sql[['SELECT']]()    |>
    sql[['FROM']](table) |>
    operations[['ExecuteQuery']]()
  }
  operations[['SelectWhereId']]     <- \(fields, table, id) {
    fields |>
      sql[['SELECT']]()        |>
      sql[['FROM']](table)     |>
      sql[['WHERE']]('Id', id) |>
      operations[['ExecuteQuery']]()
  }
  operations[['Update']]            <- \(entity, table) {       
    table |>
    sql[['UPDATE']]()     |>
    sql[['SET']](entity)    |>
    sql[['WHERE']]('Id', entity[['Id']]) |>
    operations[['ExecuteQuery']]()
  }
  operations[['Delete']]            <- \(id, table) {
    sql[['DELETE']]()        |>
    sql[['FROM']](table)     |>
    sql[['WHERE']]('Id', id) |>
    operations[['ExecuteQuery']]()
  }
  return(operations)
}
