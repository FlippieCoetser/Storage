#' Storage Server
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
Storage.Service <- \(broker) {
  validate <- Storage.Validator()
  
  services <- list()
  services[['ExecuteQuery']]     <- \(query) {
    # TODO: Extensive query validation.
    # Current validation check for NULL only.
    query |> validate[['Query']]()
    query |> broker[['ExecuteQuery']]()
  }
  services[['Insert']]           <- \(entity, table) {
    entity |> broker[['Insert']](table)
  }
  services[['Select']]           <- \(fields, table) {
    fields |> broker[['Select']](table)
  }
  services[['SelectWhereId']]    <- \(fields, table, id) {
    fields |> broker[['SelectWhereId']](table, id)
  }
  services[['Update']]           <- \(entity, table) {
    entity |> broker[['Update']](table)
  }
  services[['Delete']]           <- \(id, table) {
    id |> broker[['Delete']](table)
  }
  return(services)
}