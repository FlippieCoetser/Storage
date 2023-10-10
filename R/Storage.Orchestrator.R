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
  orchestrations[['Seed.Table']]      <- \(data, table) {
    data |> service[['Seed.Table']](table)
  }
  orchestrations[['Execute.Query']]   <- \(query) {
    query |> service[['Execute.Query']]()
  }
  orchestrations[['Add']]             <- \(entity, table) {
    entity |> service[['Add']](table)
  }
  orchestrations[['Retrieve']]        <- \(table, fields = '*') {
    table |> service[['Retrieve']](fields)
  }
  orchestrations[['RetrieveWhereId']] <- \(id, table, fields = '*') {
    id |> service[['RetrieveWhereId']](table,fields)
  }
  orchestrations[['Modify']]          <- \(entity, table) {
    entity |> service[['Modify']](table)
  }
  orchestrations[['Remove']]          <- \(id, table) {
    id |> service[['Remove']](table)
  }
  return(orchestrations)
}