ODBC.Storage.Service <- \(broker) {
  validate <- ODBC.Storage.Validator(broker)
  
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

    table  |> validate[['Is.Existing.Table']]()
    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields = '*') {
    table |> validate[['Table']]()

    table |> validate[['Is.Existing.Table']]()

    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields = '*') {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> validate[['Is.Existing.Table']]()

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