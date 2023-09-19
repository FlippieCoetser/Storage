Storage.Orchestrator <- \(configuration, type = 'Mock', data = NULL) {
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