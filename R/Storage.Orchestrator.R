Storage.Orchestrator <- \(configuration, type = 'odbc') {
  services <- list()
  services[['memory']] <- \() {
    configuration |> Memory.Storage.Broker() |> Memory.Storage.Service()
  }
  services[['odbc']]   <- \() {
    validate <- ODBC.Configuration.Validator()

    configuration |> validate[['Configuration']]()
    configuration |> ODBC.Storage.Broker() |> ODBC.Storage.Service()
  }
  service <- services[[type]]()

  orchestrations <- list()
  orchestrations[['SeedTable']]         <- \(data, table) {
    data |> service[['SeedTable']](table)
  }
  orchestrations[['ExecuteQuery']] <- \(query) {
    query |> service[['ExecuteQuery']]()
  }
  orchestrations[['Add']]       <- \(entity, table) {
    entity |> service[['Add']](table)
  }
  orchestrations[['Retrieve']]       <- \(fields, table) {
    fields |> service[['Retrieve']](table)
  }
  orchestrations[['RetrieveWhereId']]<- \(fields, table, id) {
    fields |> service[['RetrieveWhereId']](table, id)
  }
  orchestrations[['Modify']]       <- \(entity, table) {
    entity |> service[['Modify']](table)
  }
  orchestrations[['Remove']]       <- \(id, table) {
    id |> service[['Remove']](table)
  }
  return(orchestrations)
}