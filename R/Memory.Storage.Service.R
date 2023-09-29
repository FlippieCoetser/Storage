Memory.Storage.Service <- \(broker) {
  validate  <- Memory.Storage.Validator(broker)
  
  services <- list()
  services[['CreateTable']]     <- \(model, table) {
    model |> validate[['Model']]()
    table |> validate[['Table']]()

    model |> broker[['CreateTable']](table)
  }
  services[['SeedTable']]       <- \(data, table) {
    data |> validate[['Data']]()
    
    data |> broker[['SeedTable']](table)
  }
  services[['ExecuteQuery']]    <- \(...) {
    validate[['NoImplementation']]()
    ... |> broker[['ExecuteQuery']]()
  }
  services[['Add']]             <- \(entity, table) {
    table |> validate[['IsValidTable']]()

    entity |> validate[['IsNewEntity']](table)
    entity |> broker[['Insert']](table)
  }
  services[['Retrieve']]        <- \(table, fields) {
    table |> validate[['IsValidTable']]()
    table |> broker[['Select']](fields)
  }
  services[['RetrieveWhereId']] <- \(id, table, fields) {
    table |> validate[['IsValidTable']]()

    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Modify']]          <- \(entity, table) {
    table |> validate[['IsValidTable']]()

    entity |> validate[['EntityExist']](table)
    entity |> broker[['Update']](table)
  }
  services[['Remove']]          <- \(id, table) {
    table |> validate[['IsValidTable']]()
    
    id |> broker[['Delete']](table)
  }
  return(services)
}