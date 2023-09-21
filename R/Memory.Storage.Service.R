Memory.Storage.Service <- \(broker) {
  services <- list()
  services[['ExecuteQuery']]  <- \(query) {
    query |> broker[['ExecuteQuery']]()
  }
  services[['Insert']]        <- \() {}
  services[['Select']]        <- \() {}
  services[['SelectWhereId']] <- \() {}
  services[['Update']]        <- \() {}
  services[['Delete']]        <- \() {}
  return(services)
}