Todo.Broker <- \(storage) {
  sql.utilities <- Query::SQL.Utilities()
  sql.functions <- Query::SQL.Functions()

  fields <- list(
    'Id'     |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('Id'),
    'Task'   |> sql.utilities[['BRACKET']](),
    'Status' |> sql.utilities[['BRACKET']]()
  )
  table <- 'Todo'

  operations <- list()
  operations[['Insert']]        <- \(todo) {
    todo |> storage[['Insert']](table)
  }
  operations[['Select']]        <- \(...)  {
    fields |> storage[['Select']](table)
  }
  operations[['SelectWhereId']] <- \(id)   {
    fields |> storage[['SelectWhereId']](table, id)
  }
  operations[['Update']]        <- \(todo) {
    todo |> storage[['Update']](table)
  }
  operations[['Delete']]        <- \(id)   {
    id |> storage[['Delete']](table)
  }
  return(operations)
}