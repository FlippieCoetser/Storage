Storage.Orchestrator <- \(configuration, type = 'Mock', data = NULL) {
  services <- list()
  services[['Mock']] <- \() configuration |> Mock.Storage.Broker(data)
  services[['ODBC']] <- \() configuration |> ODBC.Storage.Broker()

  service <- services[[type]]()

  orchestrations <- list()
  orchestrations[['ExecuteQuery']] <- \(query) {
    query |> service[['ExecuteQuery']]()
  }
  orchestrations[['Insert']]       <- \() {}
  orchestrations[['Select']]       <- \() {}
  orchestrations[['SelectWhereId']]<- \() {}
  orchestrations[['Update']]       <- \() {}
  return(orchestrations)
}