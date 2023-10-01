Memory.Storage.Broker <- \(configuration = NULL) {
  tables <- list()

  operations <- list()
  # TODO: Refactor -> Create.Table
  operations[['CreateTable']]   <- \(model, table) {
    tables[[table]] <<- model
    return(NULL)
  }
  # TODO: Refactor -> Seed.Table
  operations[['SeedTable']]     <- \(data, table) {
    tables[[table]] <<- tables[[table]] |> rbind(data)
    return(NULL)
  }
  # TODO: Refactor -> Get.Table.Names
  operations[['GetTableNames']] <- \() {
    tables |> names()
  }
  # TODO: Refactor -> Execute.Query
  operations[['ExecuteQuery']]  <- \(query) {
    return(data.frame())
  }
  operations[['Insert']]        <- \(entity, table) {
    tables[[table]] <<- tables[[table]] |> rbind(entity)
    return(data.frame())
  }
  operations[['Select']]        <- \(table, fields = NULL) {
    tables[[table]]
  }
  operations[['SelectWhereId']] <- \(id, table, fields = NULL) {
    tables[[table]][tables[[table]][['Id']] == id,]
  }
  operations[['Update']]        <- \(entity, table) {
    condition <- tables[[table]][['Id']] == entity[['Id']]
    tables[[table]][condition,] <<- entity
    return(data.frame())      
  }
  operations[['Delete']]        <- \(id, table) {
    condition <- tables[[table]][['Id']] != id
    tables[[table]] <<- tables[[table]][condition,]
    return(data.frame())
  }
  return(operations)  
}