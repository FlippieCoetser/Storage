#' Mock Storage Broker
#'
#' @description
#' Provide a mock data store with basic CRUD Operations.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `Insert(entity, table)`
#' * `Select(fields, table)`
#' * `SelectWhereId(fields, table, id)`
#' * `Update(entity, table)`
#' * `Delete(id, table)`
#' @export
Mock.Storage.Broker <- \(configuration = NULL, data = NULL) {
  exception <- Storage.Exceptions()

  operations <- list()
  operations[['ExecuteQuery']]     <- \() {}
  operations[['Insert']]           <- \(entity, table) {
    match.count <- (data[[table]][['Id']] == entity[['Id']]) |> sum()
    (match.count != 0) |> exception[['DuplicateKey']]()
    data[[table]] <<- data[[table]] |> rbind(entity)
    return(data.frame())
  }
  operations[['Select']]           <- \(fields, table) {
    data[[table]]
  }
  operations[['SelectWhereId']]    <- \(fields, table, id) {
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