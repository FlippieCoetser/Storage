ODBC.Storage.Service <- \(broker) {
  validate <- ODBC.Storage.Validator()

  filter.tables   <- \(table) broker[['get.tables']]() |> subset(name == table)
  
  services <- list()
  services[['execute.query']]    <- \(query) {
    # TODO: Extensive query validation.
    # Current validation check for NULL only.
    query |> validate[['Query']]()
    query |> broker[['execute.query']]()
  }
  services[['add']]             <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['is.existing.table']](table)
    # TODO: entity |> validate[['is.new.entity']](table)

    entity |> broker[['insert']](table)
  }
  services[['retrieve']]        <- \(table, fields = '*') {
    table |> validate[['Table']]()

    table  |> filter.tables() |> validate[['is.existing.table']](table)

    table |> broker[['select']](fields)
  }
  services[['retrieve.where.id']] <- \(id, table, fields = '*') {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['is.existing.table']](table)

    id |> broker[['select.where.Id']](table, fields)
  }
  services[['modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['is.existing.table']](table)
    # TODO: entity |> validate[['is.existing.entity']](table)
    
    entity |> broker[['update']](table)
  }
  services[['remove']]          <- \(id, table) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table  |> filter.tables() |> validate[['is.existing.table']](table)

    id |> broker[['delete']](table)
  }
  return(services)
}