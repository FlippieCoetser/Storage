Memory.Storage.Service <- \(broker) {
  validate <- Memory.Storage.Validator()

  filter.tables   <- \(table) broker[['Get.Tables']]() |> subset(name == table)
  filter.entities <- \(entity, table) entity[['Id']] |> broker[['SelectWhereId']](table)
    
  services <- list()
  services[['Create.Table']]    <- \(model, table) {
    model |> validate[['Model']]()
    table |> validate[['Table']]()

    model |> broker[['Create.Table']](table)
  }
  services[['Seed.Table']]      <- \(data, table) {
    data  |> validate[['Data']]()
    table |> validate[['Table']]()

    data  |> broker[['Seed.Table']](table)
  }
  services[['Execute.Query']]   <- \(...) {
    TRUE |> validate[['Not.Implemented']]()
    ...  |> broker[['Execute.Query']]()
  }
  services[['Add']]             <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)
    entity |> filter.entities(table) |> validate[['Is.New.Entity']]()

    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields) {
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['Is.Existing.Table']](table)

    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['Is.Existing.Table']](table)

    id    |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table  |> filter.tables() |> validate[['Is.Existing.Table']](table)
    entity |> filter.entities(table) |> validate[['Is.Existing.Entity']]()

    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> filter.tables() |> validate[['Is.Existing.Table']](table)
    
    id    |> broker[['Delete']](table)
  }
  return(services)
}