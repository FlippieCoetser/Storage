Memory.Storage.Service <- \(broker) {
  validate  <- Memory.Storage.Validator()
  services <- list()
  services[['ExecuteQuery']]  <- \(...) {
    validate[['NoImplementation']]()
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
  services[['Delete']]        <- \(id, table) {
    id |> broker[['Delete']](table)
  }
  return(services)
}