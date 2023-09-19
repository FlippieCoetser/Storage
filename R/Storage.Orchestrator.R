#' Storage Orchestrator
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
Storage.Orchestrator <- \(configuration, type = 'ODBC', data = NULL) {
  services <- list()
  services[['Mock']] <- \() configuration |> Mock.Storage.Broker(data)
  services[['ODBC']] <- \() configuration |> ODBC.Storage.Broker()

  service <- services[[type]]()

  orchestrations <- list()
  orchestrations[['ExecuteQuery']] <- \(query) {
    query |> service[['ExecuteQuery']]()
  }
  orchestrations[['Insert']]       <- \(entity, table) {
    entity |> service[['Insert']](table)
  }
  orchestrations[['Select']]       <- \(fields, table) {
    fields |> service[['Select']](table)
  }
  orchestrations[['SelectWhereId']]<- \(fields, table, id) {
    fields |> service[['SelectWhereId']](table, id)
  }
  orchestrations[['Update']]       <- \(entity, table) {
    entity |> service[['Update']](table)
  }
  orchestrations[['Delete']]       <- \(id, table) {
    id |> service[['Delete']](table)
  }
  return(orchestrations)
}