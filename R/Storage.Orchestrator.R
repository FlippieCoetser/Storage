Storage.Orchestrator <- \(configuration, type = 'odbc', data = NULL) {
  services <- list()
  services[['memory']] <- \() {
    configuration |> Memory.Storage.Broker(data) |> Memory.Storage.Service()
  }
  services[['odbc']]   <- \() {
    configuration |> ODBC.Storage.Broker() |> ODBC.Storage.Service()
  }
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