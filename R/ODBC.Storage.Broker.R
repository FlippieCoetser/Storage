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
  validate <- Configuration.Validator()
  configuration |> validate[['PresetConfig']]()
    
  sql <- Query::SQL()

  operations <- list()
  operations[['CreateConnection']]  <- \() {
    exception  <- Storage.Exceptions()
    config <- list(
      drv = odbc::odbc(),
      dsn = configuration[['dsn']],
      uid = configuration[['uid']],
      pwd = configuration[['pwd']]
    )
    tryCatch(
      DBI::dbConnect |> do.call(config),
      error=exception[['Connection']]
    )
  }
  operations[['ExecuteQuery']]      <- \(query) {
    connection <- operations[['CreateConnection']]()
    exception  <- Storage.Exceptions()

    output <- tryCatch(
        connection |> DBI::dbGetQuery(query),
        error = exception[['Query']]
    )

    # Use new environment for connections
    # Close based on usage: Little use close quickly. Lots of use close slowly.
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
