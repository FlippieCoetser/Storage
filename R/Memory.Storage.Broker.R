Memory.Storage.Broker <- \(configuration = NULL) {
  data <- list()

  operations <- list()
  operations[['Seed']]             <- \(entities, table) {
    data[[table]] <<- entities
    return(NULL)
  }
  operations[['GetTableNames']]    <- \() {
    data |> names()
  }
  operations[['ExecuteQuery']]     <- \(query) {
    return(data.frame())
  }
  operations[['Insert']]           <- \(entity, table) {
    data[[table]] <<- data[[table]] |> rbind(entity)
    return(data.frame())
  }
  operations[['Select']]           <- \(table, fields = NULL) {
    data[[table]]
  }
  operations[['SelectWhereId']]    <- \(id, table, fields = NULL) {
    data[[table]][data[[table]][['Id']] == id,]
  }
  operations[['Update']]           <- \(entity, table) {
    condition <- data[[table]][['Id']] == entity[['Id']]
    data[[table]][condition,] <<- entity
    return(data.frame())      
  }
  operations[['Delete']]           <- \(id, table) {
    condition <- data[[table]][['Id']] != id
    data[[table]] <<- data[[table]][condition,]
    return(data.frame())
  }
  return(operations)  
}