configurator  <-   
  ODBC.Configuration.Broker()  |>
  ODBC.Configuration.Service() |>
  ODBC.Configuration.Processor()
  
sql           <- Query::SQL()
sql.utilities <- Query::SQL.Utilities()
sql.functions <- Query::SQL.Functions()

fields <- list(
  'id'     |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('id'),
  'task'   |> sql.utilities[['BRACKET']](),
  'status' |> sql.utilities[['BRACKET']]()
)
table <- 'Todo'

SelectFrom <- \() {
  fields |> 
  sql[['SELECT']]() |> 
  sql[['FROM']]('Todo')
}

SelectFromWhere <- \(id) {
  fields |> 
    sql[['SELECT']]()        |> 
    sql[['FROM']]('Todo')    |> 
    sql[['WHERE']]('id', id)  
} 

InsertValue <- \(todo) {
  table |> 
    sql[['INSERT']](todo) |>
    sql[['VALUES']](todo)
}

DeleteFromWhere <- \(id) {
  sql[['DELETE']]()        |>
  sql[['FROM']]('Todo')    |>
  sql[['WHERE']]('id', id)
}
