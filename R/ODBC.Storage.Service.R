ODBC.Storage.Service <- \(broker) {
  validate <- ODBC.Storage.Validator()
  
  services <- list()
  services[['Execute.Query']]    <- \(query) {
    # TODO: Extensive query validation.
    # Current validation check for NULL only.
    query |> validate[['Query']]()
    query |> broker[['Execute.Query']]()
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
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()
    
    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    id |> broker[['Delete']](table)
  }
  return(services)
}