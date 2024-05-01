#' Example Todo Broker
#'
#' @description
#' Provide a Broker which leverage the storage interface provided by this package.
#' The broker excludes structural and logical validation of data.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `insert(todo)`
#' * `select(...)`
#' * `select.where.Id(id)`
#' * `update(todo)`
#' * `delete(id)`
#' @export
Todo.Broker <- \(storage) {
  sql.utilities <- Query::SQL.Utilities()
  sql.functions <- Query::SQL.Functions()

  fields <- list(
    'id'     |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('id'),
    'task'   |> sql.utilities[['BRACKET']](),
    'status' |> sql.utilities[['BRACKET']]()
  )
  table <- 'Todo'

  operations <- list()
  operations[['insert']]        <- \(todo) {
    todo |> storage[['add']](table)
  }
  operations[['select']]        <- \(...)  {
    table |> storage[['retrieve']](fields)
  }
  operations[['select.where.Id']] <- \(id)   {
    id |> storage[['retrieve.where.id']](table, fields)
  }
  operations[['update']]        <- \(todo) {
    todo |> storage[['modify']](table)
  }
  operations[['delete']]        <- \(id)   {
    id |> storage[['remove']](table)
  }
  return(operations)
}