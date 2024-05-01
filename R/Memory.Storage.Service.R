Memory.Storage.Service <- \(broker) {
  validate <- Memory.Storage.Validator()

  filter.tables   <- \(table) broker[['get.tables']]() |> subset(name == table)
  filter.entities <- \(entity, table) entity[['id']] |> broker[['select.where.Id']](table)
    
  services <- list()
  services[['create.table']]    <- \(model, table) {
    model |> validate[['Model']]()
    table |> validate[['Table']]()

    model |> broker[['create.table']](table)
  }
  services[['seed.table']]      <- \(data, table) {
    data  |> validate[['Data']]()
    table |> validate[['Table']]()

    data  |> broker[['seed.table']](table)
  }
  services[['execute.query']]   <- \(...) {
    TRUE |> validate[['not.implemented']]()
    ...  |> broker[['execute.query']]()
  }
  services[['add']]             <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['is.existing.table']](table)
    entity |> filter.entities(table) |> validate[['is.new.entity']]()

    entity |> broker[['insert']](table)
  }
  services[['retrieve']]        <- \(table, fields) {
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['is.existing.table']](table)

    table |> broker[['select']](fields)
  }
  services[['retrieve.where.id']] <- \(id, table, fields) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['is.existing.table']](table)

    id    |> broker[['select.where.Id']](table, fields)
  }
  services[['modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['is.existing.table']](table)
    entity |> filter.entities(table) |> validate[['is.existing.entity']]()

    entity |> broker[['update']](table)
  }
  services[['remove']]          <- \(id, table) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['is.existing.table']](table)
    
    id    |> broker[['delete']](table)
  }
  return(services)
}