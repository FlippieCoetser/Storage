Memory.Storage.Broker <- \(configuration = NULL) {
  tables <- list()

  operations <- list()
  operations[['Create.Table']]  <- \(model, table) {
    tables[[table]] <<- model
    return(NULL)
  }
  operations[['Seed.Table']]    <- \(data, table) {
    tables[[table]] <<- tables[[table]] |> rbind(data)
    return(NULL)
  }
  operations[['Get.Tables']]    <- \() {
    tables |> names() |> (\(name) data.frame(name = name))()
  }
  operations[['Execute.Query']] <- \(query) {
    return(data.frame())
  }
  operations[['Insert']]        <- \(entity, table) {
    tables[[table]] <<- tables[[table]] |> rbind(entity)
    return(data.frame())
  }
  operations[['Select']]        <- \(table, fields = '*') {
    tables[[table]]
  }
  operations[['SelectWhereId']] <- \(id, table, fields = '*') {
    tables[[table]][tables[[table]][['id']] == id,]
  }
  operations[['Update']]        <- \(entity, table) {
    condition <- tables[[table]][['id']] == entity[['id']]
    tables[[table]][condition,] <<- entity
    return(data.frame())      
  }
  operations[['Delete']]        <- \(id, table) {
    condition <- tables[[table]][['id']] != id
    tables[[table]] <<- tables[[table]][condition,]
    return(data.frame())
  }
  return(operations)  
}