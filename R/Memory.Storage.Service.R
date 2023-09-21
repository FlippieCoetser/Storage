Memory.Storage.Service <- \(broker) {
  services <- list()
  services[['ExecuteQuery']]  <- \(query) {
    query |> broker[['ExecuteQuery']]()
  }
  services[['Insert']]        <- \(entity, table) {
    entity |> broker[['Insert']](table)
  }
  services[['Select']]        <- \(fields, table) {
    fields |> broker[['Select']](table)
  }
  services[['SelectWhereId']] <- \(fields, table, id) {
    fields |> broker[['SelectWhereId']](table, id)
  }
  services[['Update']]        <- \(entity, table) {
    entity |> broker[['Update']](table)
  }
  services[['Delete']]        <- \() {}
  return(services)
}