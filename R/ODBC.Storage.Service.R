ODBC.Storage.Service <- \(broker) {
  validate <- ODBC.Storage.Validator()
  
  services <- list()
  services[['ExecuteQuery']]    <- \(query) {
    # TODO: Extensive query validation.
    # Current validation check for NULL only.
    query |> validate[['Query']]()
    query |> broker[['ExecuteQuery']]()
  }
  services[['Add']]             <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields) {
    table |> validate[['Table']]()

    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields) {
    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    
    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    id |> broker[['Delete']](table)
  }
  return(services)
}