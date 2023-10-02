Memory.Storage.Service <- \(broker) {
  validate.structure <- Memory.Storage.Structure.Validator()
  validate.logic     <- Memory.Storage.Logic.Validator(broker)
  
  services <- list()
  services[['Create.Table']]    <- \(model, table) {
    model |> validate.structure[['Model']]()
    table |> validate.structure[['Table']]()

    model |> broker[['Create.Table']](table)
  }
  services[['Seed.Table']]      <- \(data, table) {
    data  |> validate.structure[['Data']]()
    table |> validate.structure[['Table']]()

    data  |> broker[['Seed.Table']](table)
  }
  services[['Execute.Query']]   <- \(...) {
    TRUE |> validate.structure[['NoImplementation']]()
    ...  |> broker[['Execute.Query']]()
  }
  services[['Add']]             <- \(entity, table) {
    entity |> validate.structure[['Entity']]()
    table  |> validate.structure[['Table']]()

    table  |> validate.logic[['Is.Existing.Table']]()
    entity |> validate.logic[['Is.New.Entity']](table)

    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields) {
    table |> validate.structure[['Table']]()
    table |> validate.logic[['Is.Existing.Table']]()

    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields) {
    id    |> validate.structure[['Id']]()
    table |> validate.structure[['Table']]()

    table |> validate.logic[['Is.Existing.Table']]()

    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    entity |> validate.structure[['Entity']]()
    table  |> validate.structure[['Table']]()

    table  |> validate.logic[['Is.Existing.Table']]()
    entity |> validate.logic[['Is.Existing.Entity']](table)

    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    id    |> validate.structure[['Id']]()
    table |> validate.structure[['Table']]()
    
    table |> validate.logic[['Is.Existing.Table']]()
    
    id |> broker[['Delete']](table)
  }
  return(services)
}