Memory.Storage.Broker <- \(configuration = NULL) {
  exception <- Memory.Storage.Exceptions()

  data <- list()

  operations <- list()
  operations[['Seed']]             <- \(entities, table) {
    data[[table]] <<- entities
    return(data.frame())
  }
  operations[['GetTableNames']]    <- \() { }
  operations[['ExecuteQuery']]     <- \(query) {
    TRUE |> exception[['NoExecuteQuery']]()
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
    match.index <- entity[['Id']] |> match(data[[table]][['Id']])
    if(match.index |> is.na() |> isFALSE()) {
      data[[table]][match.index,] <<- entity
    }
    return(data.frame())      
  }
  operations[['Delete']]           <- \(id, table) {
    data[[table]] <<- data[[table]][data[[table]][['Id']] != id,]
    return(data.frame())
  }
  return(operations)  
}