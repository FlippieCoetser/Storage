Memory.Storage.Broker <- \(configuration = NULL) {
  tables <- list()

  operations <- list()
  operations[['create.table']]  <- \(fields, table) {
    tables[[table]] <<- fields
    return(NULL)
  }
  operations[['seed.table']]    <- \(data, table) {
    tables[[table]] <<- tables[[table]] |> rbind(data)
    return(NULL)
  }
  operations[['get.tables']]    <- \() {
    tables |> names() |> (\(name) data.frame(name = name))()
  }
  operations[['execute.query']] <- \(query) {
    return(data.frame())
  }
  operations[['insert']]        <- \(entity, table) {
    tables[[table]] <<- tables[[table]] |> rbind(entity)
    return(data.frame())
  }
  operations[['select']]        <- \(table, fields = '*') {
    tables[[table]]
  }
  operations[['select.where.Id']] <- \(id, table, fields = '*') {
    tables[[table]][tables[[table]][['id']] == id,]
  }
  operations[['update']]        <- \(entity, table) {
    condition <- tables[[table]][['id']] == entity[['id']]
    tables[[table]][condition,] <<- entity
    return(data.frame())      
  }
  operations[['delete']]        <- \(id, table) {
    condition <- tables[[table]][['id']] != id
    tables[[table]] <<- tables[[table]][condition,]
    return(data.frame())
  }
  return(operations)  
}