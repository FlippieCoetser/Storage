Memory.Storage.Broker <- \(configuration = NULL) {
  tables <- list()

  operations <- list()
  operations[['CreateTable']]      <- \(model, table) {
    tables[[table]] <<- model
    return(NULL)
   }
  operations[['Seed']]             <- \(data, table) {
    tables[[table]] <<- data
    return(NULL)
  }
  operations[['GetTableNames']]    <- \() {
    tables |> names()
  }
  operations[['ExecuteQuery']]     <- \(query) {
    return(data.frame())
  }
  operations[['Insert']]           <- \(entity, table) {
    tables[[table]] <<- tables[[table]] |> rbind(entity)
    return(data.frame())
  }
  operations[['Select']]           <- \(table, fields = NULL) {
    tables[[table]]
  }
  operations[['SelectWhereId']]    <- \(id, table, fields = NULL) {
    tables[[table]][tables[[table]][['Id']] == id,]
  }
  operations[['Update']]           <- \(entity, table) {
    condition <- tables[[table]][['Id']] == entity[['Id']]
    tables[[table]][condition,] <<- entity
    return(data.frame())      
  }
  operations[['Delete']]           <- \(id, table) {
    condition <- tables[[table]][['Id']] != id
    tables[[table]] <<- tables[[table]][condition,]
    return(data.frame())
  }
  return(operations)  
}