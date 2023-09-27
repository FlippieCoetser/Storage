Memory.Storage.Service <- \(broker) {
  validate  <- Memory.Storage.Validator(broker)
  
  services <- list()
  services[['CreateTable']]   <- \() {}
  services[['SeedTable']]          <- \(data, table) {
    data |> broker[['SeedTable']](table)
  }
  services[['ExecuteQuery']]  <- \(...) {
    validate[['NoImplementation']]()
    ... |> broker[['ExecuteQuery']]()
  }
  services[['Insert']]        <- \(entity, table) {
    table |> validate[['IsValidTable']]()

    entity |> validate[['IsNewEntity']](table)
    entity |> broker[['Insert']](table)
  }
  services[['Select']]        <- \(table, fields) {
    table |> validate[['IsValidTable']]()
    table |> broker[['Select']](fields)
  }
  services[['SelectWhereId']] <- \(id, table, fields) {
    table |> validate[['IsValidTable']]()

    id |> broker[['SelectWhereId']](table, fields)
  }
  services[['Update']]        <- \(entity, table) {
    table |> validate[['IsValidTable']]()

    entity |> validate[['EntityExist']](table)
    entity |> broker[['Update']](table)
  }
  services[['Delete']]        <- \(id, table) {
    table |> validate[['IsValidTable']]()
    
    id |> broker[['Delete']](table)
  }
  return(services)
}