ODBC.Storage.Service <- \(broker) {
  validate <- ODBC.Storage.Validator()
  
  services <- list()
  services[['ExecuteQuery']]     <- \(query) {
    # TODO: Extensive query validation.
    # Current validation check for NULL only.
    query |> validate[['Query']]()
    query |> broker[['ExecuteQuery']]()
  }
  services[['Insert']]           <- \(entity, table) {
    entity |> broker[['Insert']](table)
  }
  services[['Select']]           <- \(table, fields) {
    table |> broker[['Select']](fields)
  }
  services[['SelectWhereId']]    <- \(id, table, fields) {
    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Update']]           <- \(entity, table) {
    entity |> broker[['Update']](table)
  }
  services[['Delete']]           <- \(id, table) {
    id |> broker[['Delete']](table)
  }
  return(services)
}