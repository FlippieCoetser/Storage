Memory.Storage.Service <- \(broker) {
  validate  <- Memory.Storage.Validator()
  
  services <- list()
  services[['Seed']]          <- \() {}
  services[['ExecuteQuery']]  <- \(...) {
    validate[['NoImplementation']]()
  }
  services[['Insert']]        <- \(entity, table) {
    entity |> broker[['Insert']](table)
  }
  services[['Select']]        <- \(table, fields) {
    table |> broker[['Select']](fields)
  }
  services[['SelectWhereId']] <- \(id, table, fields) {
    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Update']]        <- \(entity, table) {
    entity |> broker[['Update']](table)
  }
  services[['Delete']]        <- \(id, table) {
    id |> broker[['Delete']](table)
  }
  return(services)
}