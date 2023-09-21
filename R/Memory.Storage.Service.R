Memory.Storage.Service <- \(broker) {
  services <- list()
  services[['ExecuteQuery']]  <- \(query) {
    query |> broker[['ExecuteQuery']]()
  }
  services[['Insert']]        <- \(entity, table) {
    entity |> broker[['Insert']](table)
  }
  services[['Select']]        <- \() {}
  services[['SelectWhereId']] <- \() {}
  services[['Update']]        <- \() {}
  services[['Delete']]        <- \() {}
  return(services)
}