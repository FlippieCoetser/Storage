Memory.Storage.Service <- \(broker) {
  validate.structure <- Memory.Storage.Structure.Validator()
  validate.logic     <- Memory.Storage.Logic.Validator(broker)
  
  services <- list()
  services[['Create.Table']]    <- \(model, table) {
    table |> validate.structure[['Table']]()

    model |> 
      validate.structure[['Model']]() |> 
      broker[['Create.Table']](table)
  }
  services[['Seed.Table']]      <- \(data, table) {
    table |> validate.structure[['Table']]()

    data |> 
      validate.structure[['Data']]() |> 
      broker[['Seed.Table']](table)
  }
  services[['Execute.Query']]   <- \(...) {
    TRUE |> validate.structure[['NoImplementation']]()
    ...  |> broker[['Execute.Query']]()
  }
  services[['Add']]             <- \(entity, table) {
    table |> 
      validate.structure[['Table']]() |> 
      validate.logic[['Is.Existing.Table']]()

    entity |> 
      validate.structure[['Entity']]() |> 
      validate.logic[['Is.New.Entity']](table) |> 
      broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields) {
    table |> 
      validate.structure[['Table']]() |> 
      validate.logic[['Is.Existing.Table']]() |> 
      broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields) {
    table |> 
      validate.structure[['Table']]() |> 
      validate.logic[['Is.Existing.Table']]()

    id |> 
      validate.structure[['Id']]() |> 
      broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    table  |> 
      validate.structure[['Table']]()  |> 
      validate.logic[['Is.Existing.Table']]()

    entity |> 
      validate.structure[['Entity']]() |> 
      validate.logic[['Is.Existing.Entity']](table) |> 
      broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    table |> 
      validate.structure[['Table']]() |>
      validate.logic[['Is.Existing.Table']]()

    id |> 
      validate.structure[['Id']]() |> 
      broker[['Delete']](table)
  }
  return(services)
}