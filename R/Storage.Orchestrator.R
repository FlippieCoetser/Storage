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
  orchestrations[['seed.table']]      <- \(data, table) {
    data |> service[['seed.table']](table)
  }
  orchestrations[['execute.query']]   <- \(query) {
    query |> service[['execute.query']]()
  }
  orchestrations[['add']]             <- \(entity, table) {
    entity |> service[['add']](table)
  }
  orchestrations[['retrieve']]        <- \(table, fields = '*') {
    table |> service[['retrieve']](fields)
  }
  orchestrations[['retrieve.where.id']] <- \(id, table, fields = '*') {
    id |> service[['retrieve.where.id']](table,fields)
  }
  orchestrations[['modify']]          <- \(entity, table) {
    entity |> service[['modify']](table)
  }
  orchestrations[['remove']]          <- \(id, table) {
    id |> service[['remove']](table)
  }
  return(orchestrations)
}