#' Storage
#'
#' @description
#' Provide an storage interface with basic CRUD Operations with ability to switch between MOCK or ODBC Storage Provider.
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
Storage <- \(configuration, type = 'ODBC', data = NULL) {
  Storage.Orchestrator(configuration, type = 'ODBC', data = NULL)
}
