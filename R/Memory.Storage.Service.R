Memory.Storage.Service <- \(broker) {
  validate  <- Memory.Storage.Validator(broker)
  
  services <- list()
  services[['Seed']]          <- \(data, table) {
    data |> broker[['Seed']](table)
  }
  services[['ExecuteQuery']]  <- \(...) {
    validate[['NoImplementation']]()
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
    
    entity |> broker[['Update']](table)
  }
  services[['Delete']]        <- \(id, table) {
    id |> broker[['Delete']](table)
  }
  return(services)
}