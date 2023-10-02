Memory.Storage.Service <- \(broker) {
  validate  <- Memory.Storage.Validator(broker)
  
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
    TRUE |> validate[['NoImplementation']]()
    ...  |> broker[['Execute.Query']]()
  }
  services[['Add']]             <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()

    table |> validate[['Is.Existing.Table']]()

    entity |> validate[['Is.New.Entity']](table)
    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields) {
    table |> validate[['Table']]()

    table |> validate[['Is.Existing.Table']]()
    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> validate[['Is.Existing.Table']]()

    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    entity |> validate[['Entity']]()
    table  |> validate[['Table']]()
    
    table |> validate[['Is.Existing.Table']]()

    entity |> validate[['Is.Existing.Entity']](table)
    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    id    |> validate[['Id']]()
    table |> validate[['Table']]()

    table |> validate[['Is.Existing.Table']]()
    
    id |> broker[['Delete']](table)
  }
  return(services)
}