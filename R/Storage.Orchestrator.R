Storage.Orchestrator <- \(configuration, type, data = NULL) {
  services <- list()
  services[['Mock']] <- \() configuration |> Mock.Storage.Broker(data)
  services[['ODBC']] <- \() configuration |> ODBC.Storage.Broker()

  service <- services[[type]]()

  orchestrations <- list()
  orchestrations[['ExecuteQuery']] <- \(query) {
    query |> service[['ExecuteQuery']]()
  }
  return(orchestrations)
}