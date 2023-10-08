ODBC.Storage.Service <- \(broker) {
  validate <- ODBC.Storage.Validator()

  filter.tables   <- \(table) broker[['Get.Tables']]() |> subset(name == table)
  
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

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)
    # TODO: entity |> validate[['Is.New.Entity']](table)

    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields = '*') {
    table |> validate[['Table']]()

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)

    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields = '*') {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)

    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)
    # TODO: entity |> validate[['Is.Existing.Entity']](table)
    
    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)

    id |> broker[['Delete']](table)
  }
  return(services)
}