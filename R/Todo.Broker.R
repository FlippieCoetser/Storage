#' Example Todo Broker
#'
#' @description
#' Provide a Broker which leverage the storage interface provided by this package.
#' The broker excludes structural and logical validation of data.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `Insert(todo)`
#' * `Select(...)`
#' * `SelectWhereId(id)`
#' * `Update(todo)`
#' * `Delete(id)`
#' @export
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
    todo |> storage[['Add']](table)
  }
  operations[['Select']]        <- \(...)  {
    table |> storage[['Retrieve']](fields)
  }
  operations[['SelectWhereId']] <- \(id)   {
    id |> storage[['RetrieveWhereId']](table, fields)
  }
  operations[['Update']]        <- \(todo) {
    todo |> storage[['Modify']](table)
  }
  operations[['Delete']]        <- \(id)   {
    id |> storage[['Remove']](table)
  }
  return(operations)
}