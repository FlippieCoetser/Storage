configurator  <-   
  ODBC.Configuration.Broker()  |>
  ODBC.Configuration.Service() |>
  ODBC.Configuration.Processor()
  
configuration <- configurator[["GetConfig"]]()

sql           <- Query::SQL()
sql.utilities <- Query::SQL.Utilities()
sql.functions <- Query::SQL.Functions()

fields <- list(
  'Id'     |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('Id'),
  'Task'   |> sql.utilities[['BRACKET']](),
  'Status' |> sql.utilities[['BRACKET']]()
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
    sql[['WHERE']]('Id', id)  
} 

InsertValue <- \(todo) {
  table |> 
    sql[['INSERT']](todo) |>
    sql[['VALUES']](todo)
}

DeleteFromWhere <- \(id) {
  sql[['DELETE']]()        |>
  sql[['FROM']]('Todo')    |>
  sql[['WHERE']]('Id', id)
}

data <- list()
data[['Todo']] <- data.frame(
  Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
            '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
            'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
  Task   = c('Task.1','Task.2','Task.3'),
  Status = c('New','New','Done')
)